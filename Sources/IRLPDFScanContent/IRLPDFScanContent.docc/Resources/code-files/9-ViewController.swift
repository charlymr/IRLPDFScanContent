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
        pdfView.document = nil
        text.text = "Use the Scan Button"
        scanner.delegate = self
        scanner.present(animated: true, completion: nil)
    }
    
}

extension ViewController: IRLPDFScanContentProtocol {
    
    func scanContent(caller: IRLPDFScanContent, didScan scan: VNDocumentCameraScan) {

    }
    
    func scanContent(caller: IRLPDFScanContent, didFail error: Error) {

    }
    
}
