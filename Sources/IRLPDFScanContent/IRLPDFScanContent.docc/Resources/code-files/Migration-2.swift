import UIKit
import IRLPDFScanContent

class ViewController : UIViewController, IRLScannerViewControllerDelegate {
    
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var imageView:  UIImageView!
    
    // MARK: User Actions

    @IBAction func scan(_ sender: AnyObject) {
        let scanner = IRLScannerViewController.standardCameraView(with: self)
        scanner.showControls = true
        scanner.showAutoFocusWhiteRectangle = true
        present(scanner, animated: true, completion: nil)
    }
    
    // MARK: IRLScannerViewControllerDelegate
    
    func pageSnapped(_ page_image: UIImage, from controller: IRLScannerViewController) {
        controller.dismiss(animated: true) { () -> Void in
            self.imageView.image = page_image
        }
    }
        
    func cameraViewWillUpdateTitleLabel(_ cameraView: IRLScannerViewController) -> String? {
        
        var text = ""
        switch cameraView.cameraViewType {
        case .normal:           text = text + "NORMAL"
        case .blackAndWhite:    text = text + "B/W-FILTER"
        case .ultraContrast:    text = text + "CONTRAST"
        }
        
        switch cameraView.detectorType {
        case .accuracy:         text = text + " | Accuracy"
        case .performance:      text = text + " | Performance"
        }
        
        return text
    }

    func didCancel(_ cameraView: IRLScannerViewController) {
        cameraView.dismiss(animated: true){ ()-> Void in
            NSLog("Cancel pressed");
           }
    }
    
}
