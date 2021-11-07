//
//  File.swift
//  
//
//  Created by Denis Martin-Bruillot on 07/11/2021.
//

import VisionKit

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
public typealias IRLScannerViewController = VNDocumentCameraViewController

/// [IRLScannerViewController](https://github.com/charlymr/IRLDocumentScanner) Was fully functional instance  allowing you to scan a document with automatic border detection, prior to iOS 13.
///  This Protocol is only here to provide compatibility and should not be use
@available(*, deprecated, message: "Should be replaced by `IRLPDFScanContent`")
public protocol IRLScannerViewControllerVNDocumentCameraViewAdditions: NSObjectProtocol {
    
    /// Legacy enum
    /// - Warning: ⚠️ SHOULD BE  replaced by `IRLPDFScanContent`
    typealias IRLScannerViewType = VNDocumentCameraViewController.IRLScannerViewType
    
    /// Legacy enum
    /// - Warning: ⚠️ SHOULD BE  replaced by `IRLPDFScanContent`
    typealias IRLScannerDetectorType = VNDocumentCameraViewController.IRLScannerDetectorType

    /// Legacy Initializer
    /// - Warning: ⚠️ SHOULD BE  replaced by `IRLPDFScanContent`
    static func standardCameraView(with delegate: IRLScannerViewControllerDelegate) -> IRLScannerViewController
    
    /// Legacy Initializer
    /// - Warning: ⚠️ SHOULD BE  replaced by `IRLPDFScanContent`
    static func cameraView(withDefaultType defaultType: IRLScannerViewType, defaultDetectorType: IRLScannerDetectorType, with delegate: IRLScannerViewControllerDelegate) -> IRLScannerViewController

}

/// Add exiting variables/methods to VNDocumentCameraViewController for legacy support
@available(*, deprecated, message: "Should be replaced by `IRLPDFScanContent`")
public extension IRLScannerViewControllerVNDocumentCameraViewAdditions where Self: VNDocumentCameraViewController  {
    
    /// LegacyInitializer
    /// - Warning: ⚠️ SHOULD BE  replaced by `IRLPDFScanContent`
    @available(*, deprecated, message: "Should be replaced by `IRLPDFScanContent`")
    static func standardCameraView(with delegate: IRLScannerViewControllerDelegate) -> IRLScannerViewController {
        let scanner = VNDocumentCameraViewController()
        scanner.delegate = sharedDelegationScannerViewController
        sharedDelegationScannerViewController.cameraDelegate = delegate
        return scanner
    }
    
    /// LegacyInitializer
    /// - Warning: ⚠️ SHOULD BE  replaced by `IRLPDFScanContent`
    @available(*, deprecated, message: "Should be replaced by `IRLPDFScanContent`")
    static func cameraView(withDefaultType defaultType: IRLScannerViewType, defaultDetectorType: IRLScannerDetectorType, with delegate: IRLScannerViewControllerDelegate) -> IRLScannerViewController {
       standardCameraView(with: delegate)
    }

    /// Legacy variable - Not usable anymore
    /// - Warning: ⚠️ SHOULD BE REMOVE - Managed by the framework
    @available(*, deprecated, message: "⚠️ SHOULD BE REMOVE - Managed by the framework")
    var detectionOverlayColor: UIColor {
        set {
            // Not implemented}
        }
        get {
            .white
        }
    }
    
    /// Legacy variable - Not usable anymore
    /// - Warning: ⚠️ SHOULD BE REMOVE - Managed by the framework
    @available(*, deprecated, message: "⚠️ SHOULD BE REMOVE - Managed by the framework")
    var cameraViewType: IRLScannerViewType {
        set {
            // Not implemented}
        }
        get {
            .normal
        }
    }
    
    /// Legacy variable - Not usable anymore
    /// - Warning: ⚠️ SHOULD BE REMOVE - Managed by the framework
    @available(*, deprecated, message: "⚠️ SHOULD BE REMOVE - Managed by the framework")
    var detectorType: IRLScannerDetectorType {
        set {
            // Not implemented}
        }
        get {
            .accuracy
        }
    }
    
    /// Legacy variable - Not usable anymore
    /// - Warning: ⚠️ SHOULD BE REMOVE - Managed by the framework
    @available(*, deprecated, message: "⚠️ SHOULD BE REMOVE - Managed by the framework")
    var showControls: Bool {
        set {
            // Not implemented}
        }
        get {
            true
        }
    }
    
    /// Legacy variable - Not usable anymore
    /// - Warning: ⚠️ SHOULD BE REMOVE - Managed by the framework
    @available(*, deprecated, message: "⚠️ SHOULD BE REMOVE - Managed by the framework")
    var showAutoFocusWhiteRectangle: Bool {
        set {
            // Not implemented}
        }
        get {
            true
        }
    }
    
}

@available(*, deprecated, message: "Should be replaced by `IRLPDFScanContent`")
extension VNDocumentCameraViewController: IRLScannerViewControllerVNDocumentCameraViewAdditions {
    
    /// Legacy Enum
    @available(*, deprecated, message: "⚠️ Linkend to LEgacy code. Here for compatibility purposes")
    public enum IRLScannerViewType {
        case normal, blackAndWhite, ultraContrast
    }

    /// Legacy Enum
    @available(*, deprecated, message: "⚠️ Linkend to LEgacy code. Here for compatibility purposes")
    public enum IRLScannerDetectorType {
        case accuracy, performance
    }

    /// Legacy variable - Not usable anymore
    /// - Warning: ⚠️ SHOULD BE REMOVE - Managed by the framework
    @available(*, deprecated, message: "⚠️ SHOULD BE REMOVE - Managed by the framework")
    @IBOutlet var flash_toggle: UIButton? {
        set {
            // Not implemented}
        }
        get {
            nil
        }
    }
    
    /// Legacy variable - Not usable anymore
    /// - Warning: ⚠️ SHOULD BE REMOVE - Managed by the framework
    @available(*, deprecated, message: "⚠️ SHOULD BE REMOVE - Managed by the framework")
    @IBOutlet var contrast_type: UIButton? {
        set {
            // Not implemented}
        }
        get {
            nil
        }
    }
    
    /// Legacy variable - Not usable anymore
    /// - Warning: ⚠️ SHOULD BE REMOVE - Managed by the framework
    @available(*, deprecated, message: "⚠️ SHOULD BE REMOVE - Managed by the framework")
    @IBOutlet  var detect_toggle: UIButton? {
        set {
            // Not implemented}
        }
        get {
            nil
        }
    }
    
    /// Legacy variable - Not usable anymore
    @available(*, deprecated, message: "⚠️ SHOULD BE REMOVE - Managed by the framework")
    @IBOutlet  var cancel_button: UIButton? {
        set {
            // Not implemented}
        }
        get {
            nil
        }
    }
    
    /// Legacy variable - Not usable anymore
    /// - Warning: ⚠️ SHOULD BE REMOVE - Managed by the framework
    @available(*, deprecated, message: "⚠️ SHOULD BE REMOVE - Managed by the framework")
    @IBOutlet  var cancel_scanning: UIButton? {
        set {
            // Not implemented}
        }
        get {
            nil
        }
    }
    
    /// Legacy function - Not usable anymore
    /// - Warning: ⚠️ SHOULD BE REMOVE - Managed by the framework
    @available(*, deprecated, message: "⚠️ SHOULD BE REMOVE - Managed by the framework")
    @IBAction func cancelTapped(sender: Any) {
        // Not Implemented
    }
}

