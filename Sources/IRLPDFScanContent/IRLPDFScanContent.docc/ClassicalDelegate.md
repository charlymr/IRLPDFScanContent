# Classical Delegate

``IRLPDFScanContent`` provide a ``IRLPDFScanContent/IRLPDFScanContent/delegate`` call for each action taken by the scanner. Check ``IRLPDFScanContentProtocol`` for more details

## Overview

This section is more for usage with a classical `UIViewController`

##### Perfrom a Scan

- Initiate the object with ``IRLPDFScanContent/IRLPDFScanContent/init(with:)`` (You may pass a delegate (``IRLPDFScanContent/IRLPDFScanContentProtocol``) or observe changes
- present you view ``IRLPDFScanContent/IRLPDFScanContent/present(animated:completion:)
- Wait for ``IRLPDFScanContent/IRLPDFScanContent/delegate`` to be call on the method: ``IRLPDFScanContent/IRLPDFScanContentProtocol/scanContent(caller:didScan:)``
- Generate a PDF using ``IRLPDFScanContent/IRLPDFScanContent/generatePDF(with:)`` and get the URL. (Or get images using ``IRLPDFScanContent/IRLPDFScanContent/scanImages``)
- Pass it a classical: [`PDFView`](https://developer.apple.com/documentation/pdfkit/pdfview)

``` swift
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
        guard let url = caller.generatePDF() else {
            return
        }
        view.sendSubviewToBack(text)
        pdfView.document = PDFDocument(url: url)
        pdfView.autoScales = true
    }
    
    func scanContent(caller: IRLPDFScanContent, didFail error: Error) {
        view.bringSubviewToFront(text)
        text.text = error.localizedDescription
    }
    
}

```
