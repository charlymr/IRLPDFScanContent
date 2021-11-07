//
//  File.swift
//  
//
//  Created by Denis Martin-Bruillot on 07/11/2021.
//

import Foundation

/// [IRLScannerViewController](https://github.com/charlymr/IRLDocumentScanner) Was a fully functional instance  allowing you to scan a document with automatic border detection, prior to iOS 13.
///
/// While it was working well, it is not time to replace it and use more modern framework such as [VisonKit](https://developer.apple.com/documentation/visionkit?language=objc)
///
/// To facilitate the switch from [IRLScannerViewController](https://github.com/charlymr/IRLDocumentScanner) to  [IRLPDFScanContent](https://irlpdfscancontent.irlmobile.com/documentation/), simply replacing the depedency will let your code work with depreciation warning.
///
/// - Use the new package and check how you can easilty implement [IRLPDFScanContent](https://irlpdfscancontent.irlmobile.com/documentation/)
/// - Just change  **`import IRLScannerViewController`** to **` import IRLPDFScanContent`**
/// - Now your code will work. Check the WARNING, and migrate your code
/// - The Migration should be straigth forward
/// - Usage example:
///```swift
/// class ViewController: UIViewController, IRLPDFScanContentProtocol {
///
///    let scanner = IRLPDFScanContent()
///
///    @IBOutlet weak var scanButton: UIButton!
///    @IBOutlet weak var imageView:  UIImageView!
///
///    // MARK: User Actions
///
///    @IBAction func scan(_ sender: AnyObject) {
///        scanner.delegate = self
///        scanner.present(animated: true, completion: nil)
///    }
///
///    // MARK: IRLPDFScanContentProtocol
///
///    func scanContent(caller: IRLPDFScanContent,
///                     didScan scan: VNDocumentCameraScan) {
///        guard let image = scan.scanImages(completion: nil).first else {
///            return
///        }
///        imageView.image = image
///    }
///
///    func scanContent(caller: IRLPDFScanContent, didFail error: Error) {
///        print(error)
///    }
///}
///```
/// - Warning: The implementation is available only for backward compatibility. Do not use this for long term, prefer ``IRLPDFScanContent/IRLPDFScanContent``
@available(*, deprecated, message: "Should be replaced by IRLPDFScanContentProtocol")
public protocol IRLScannerViewControllerDelegate: IRLPDFScanContentProtocol {
    
    /// When the camera has finish the full detection for the scan, it will call this method.
    ///
    /// - Warning:   You must implement this method
    /// - Warning: ⚠️ SHOULD BE REPLACED by  ``IRLPDFScanContent/IRLPDFScanContentProtocol/scanContent(caller:didScan:)``
    ///    - image: The scanned image
    ///    - cameraView: The instance of the ``IRLPDFScanContent/IRLScannerViewController`` controller which has perform this scan
    func pageSnapped(_ image: UIImage, from controller: IRLScannerViewController)

    /// The user has pushed the Cancel button.
    ///
    /// - Warning: ⚠️ SHOULD BE REPLACED by ``IRLPDFScanContent/IRLPDFScanContentProtocol/scanContentDissmissed(caller:)-1zf4k``
    /// - Parameters:
    ///    - cameraView: The instance of the ``IRLPDFScanContent/IRLScannerViewController`` controller which has perform this scan
    func didCancel(_ cameraView: IRLScannerViewController)

    /// The user has pushed the Cancel button.
    ///
    /// - Warning: ⚠️ SHOULD BE REPLACED by ``IRLPDFScanContent/IRLPDFScanContentProtocol/scanContentDissmissed(caller:)-1zf4k``
    /// - Parameters:
    ///    - cameraView: The instance of the ``IRLPDFScanContent/IRLScannerViewController`` controller which has perform this scan
    func cameraViewCancelRequested(_ cameraView: IRLScannerViewController)
    
    /// <Deprecated> This optional method let you decide what you want to write in the Title bar. It can be use in cases where you want to tell whihc filter the user is using. You can inspect the controller to have more details.
    ///
    /// - Warning: ⚠️ SHOULD BE REMOVE - This Method will never be call, you should remove it all together
    /// - Parameters:
    ///    - cameraView: The instance of the ``IRLPDFScanContent/IRLScannerViewController`` controller which has perform this scan
    /// - Returns: The string to display
    func cameraViewWillUpdateTitleLabel(_ cameraView: IRLScannerViewController) -> String!

    
}

@available(*, deprecated, message: "⚠️ SHOULD BE REPLACED by  by IRLPDFScanContentProtocol")
public extension IRLScannerViewControllerDelegate {

    func cameraViewCancelRequested(_ cameraView: IRLScannerViewController) {
        // Nothing here
    }
    
    func cameraViewWillUpdateTitleLabel(_ cameraView: IRLScannerViewController) -> String! {
        ""
    }
    
    func scanContent(caller: IRLPDFScanContent, didScan scan: VNDocumentCameraScan) {
        // Nothing here
    }
    
    func scanContent(caller: IRLPDFScanContent, didFail error: Error) {
        // Nothing here
    }
    
}
