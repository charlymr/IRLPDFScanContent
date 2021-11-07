import UIKit
import IRLPDFScanContent

class ViewController: UIViewController {

    let scanner = IRLPDFScanContent()
    
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.bringSubviewToFront(text)
    }

    @IBAction func startScan(_ sender: Any) {

    }
    
}
