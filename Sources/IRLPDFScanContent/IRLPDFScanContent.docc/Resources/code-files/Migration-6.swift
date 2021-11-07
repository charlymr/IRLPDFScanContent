import UIKit
import IRLPDFScanContent

class ViewController : UIViewController, IRLPDFScanContentProtocol {
    
    let scanner = IRLPDFScanContent()

    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var imageView:  UIImageView!
    
    // MARK: User Actions

    @IBAction func scan(_ sender: AnyObject) {

        
    }
    
    // MARK: IRLPDFScanContentProtocol
    
    func scanContent(caller: IRLPDFScanContent,
                     didScan scan: VNDocumentCameraScan) {
        guard let page_image = scan.scanImages(completion: nil).first else {
            return
        }
        self.imageView.image = page_image
    }
    
    func scanContent(caller: IRLPDFScanContent, didFail error: Error) {
        print(error)
    }
    
}
