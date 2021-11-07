import UIKit
import IRLPDFScanContent

class ViewController: UIViewController {
    
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.bringSubviewToFront(text)
    }

}
