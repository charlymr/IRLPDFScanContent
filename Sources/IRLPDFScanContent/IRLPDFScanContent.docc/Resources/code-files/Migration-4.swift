import UIKit
import IRLPDFScanContent

class ViewController : UIViewController, IRLPDFScanContentProtocol {
    
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var imageView:  UIImageView!
    
    // MARK: User Actions

    @IBAction func scan(_ sender: AnyObject) {

        
    }
    
    // MARK: IRLPDFScanContentProtocol
    
    func scanContent(caller: IRLPDFScanContent,
                     didScan scan: VNDocumentCameraScan) {

        self.imageView.image = page_image

    }
    
}
