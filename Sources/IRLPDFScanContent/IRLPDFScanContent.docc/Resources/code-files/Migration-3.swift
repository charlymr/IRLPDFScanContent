import UIKit
import IRLPDFScanContent

class ViewController : UIViewController, IRLPDFScanContentProtocol {
    
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var imageView:  UIImageView!
    
    // MARK: User Actions

    @IBAction func scan(_ sender: AnyObject) {

        
    }
    
    // MARK: IRLPDFScanContentProtocol
    
    func pageSnapped(_ page_image: UIImage, from controller: IRLScannerViewController) {
        controller.dismiss(animated: true) { () -> Void in
            self.imageView.image = page_image
        }
    }
    
}
