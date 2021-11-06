//
//  IRLPDFScanContent.swift
//  IRLPDFScanContent
//
//  Created by Denis Martin-Bruillot on 09/09/2021.
//  Copyright © 2021 Denis Martin-Bruillot. All rights reserved.
//

/// Use this class in to perform a scan an get the PDF or images as result
///
/// - Follow this workflow to perfrom a scan
///     - Initiate the object ``IRLPDFScanContent/IRLPDFScanContent/init(with:)`` (You may pass a delegate(``IRLPDFScanContent/IRLPDFScanContentProtocol``) or observe changes
///     - present you view ``IRLPDFScanContent/IRLPDFScanContent/present(animated:completion:)`` or  await ``IRLPDFScanContent/IRLPDFScanContent/present(animated:)``
///     - Observe the result of ``IRLPDFScanContent/IRLPDFScanContent/latestScan`` or wait for ``IRLPDFScanContent/IRLPDFScanContent/delegate``you used the delegate method
///     - Generate a PDF using ``IRLPDFScanContent/IRLPDFScanContent/generatePDF(with:)``  or  get images usin  ``IRLPDFScanContent/IRLPDFScanContent/scanImages``
public final class IRLPDFScanContent: NSObject, ObservableObject {
        
    //MARK: Public Variables
    
    /// Bew notifified of the result using a delegate
    public var delegate: IRLPDFScanContentProtocol? = nil

    /// Observable `Error` message
    @Published public var errorMessage: String?
        
    /// Observable [VNDocumentCameraScan](https://developer.apple.com/documentation/visionkit/vndocumentcamerascan) giving the result of the scan
    @Published public var latestScan: VNDocumentCameraScan? = nil
    
    /// Default name use when generating the PDF. The PDF is saved to your app documentDirectory
    public static var defaultPDFName = "scanned.pdf"
    
    //MARK: Public Initializer
    
    /// Convenient initializer passing a delegate
    /// - Parameter delegate: A delgate which will be call when we interact with the object and returning the results
    public convenience init(with delegate: IRLPDFScanContentProtocol? = nil) {
        self.init()
        self.delegate = delegate
    }
    
    /// Present the default view controller for scanning
    /// - Parameters:
    ///   - flag: Pass `true` to animate the presentation; otherwise, pass false.
    ///   - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    public func present(animated flag: Bool, completion: (() -> Void)? = nil) {
        reset()

        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        guard let rootViewController = keyWindow?.rootViewController else {
            self.delegate?.scanContentDissmissed(caller: self)
            return
        }
        rootViewController.present(getDocumentCameraViewController(), animated: flag, completion: {
            completion?()
            self.delegate?.scanContentDidPresent(caller: self, in: rootViewController)
        })
    }

    /// Present the default view controller for scanning using `await`
    /// - Parameters:
    ///   - flag: Pass `true` to animate the presentation; otherwise, pass false.
    @available(iOS 15.0.0, *)
    public func present(animated flag: Bool) async {
        return await withCheckedContinuation { continuation in
            self.present(animated: flag) {
                continuation.resume()
            }
        }
    }
    
    /// Return an array of [UIImage](https://developer.apple.com/documentation/uikit/uiimage) if the scan was performed and successfull
    public var scanImages: [UIImage]? {
        latestScan?.scanImages
    }
    
    /// Return the `URL` of a [PDFDocument](https://developer.apple.com/documentation/pdfkit/pdfdocument) if the scan was performed and successfull
    /// - Parameters:
    ///   - name: An name for the PDF (default: ``IRLPDFScanContent/IRLPDFScanContent/defaultPDFName``
    public func generatePDF(with name: String = IRLPDFScanContent.defaultPDFName) -> URL? {
        latestScan?.generatePDF(with: name)
    }
    
    /// Reset this instance, ``scanImages`` & ``generatePDF(with:)`` will retrun `nil` after you call this method
    public func reset() {
        self.latestScan = nil
        self.errorMessage = nil
    }
    
}
