# Classical Delegate

``IRLPDFScanContent`` provide a ``IRLPDFScanContent/IRLPDFScanContent/delegate`` call for each action taken by the scanner. Check ``IRLPDFScanContentProtocol`` for more details

## Overview

Here we will see how to use itin `UIKit` within a   `UIViewController`

In a nutshell, the ``IRLPDFScanContent/IRLPDFScanContent`` is independant and will report to the ``IRLPDFScanContent/IRLPDFScanContent/delegate`` any action taken by the user. 

## Perfrom a Scan

- Initiate the object with ``IRLPDFScanContent/IRLPDFScanContent/init(with:)`` (You may pass a delegate (``IRLPDFScanContent/IRLPDFScanContentProtocol``) or observe changes
- Present the scan view to the user using ``IRLPDFScanContent/IRLPDFScanContent/present(animated:completion:)
- Wait for ``IRLPDFScanContent/IRLPDFScanContent/delegate`` to be call on the method: ``IRLPDFScanContent/IRLPDFScanContentProtocol/scanContent(caller:didScan:)``
- Generate a PDF using ``IRLPDFScanContent/IRLPDFScanContent/generatePDF(with:)`` and get the URL. (Or get images using ``IRLPDFScanContent/IRLPDFScanContent/scanImages``)
- Pass it to a classical: [`PDFView`](https://developer.apple.com/documentation/pdfkit/pdfview) to display it

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
        guard let document = scan.generatePDFDocument(pdfView: self.pdfView) else {
            return
        }
        view.sendSubviewToBack(text)
        pdfView.document = document
    }
    
    func scanContent(caller: IRLPDFScanContent, didFail error: Error) {
        view.bringSubviewToFront(text)
        text.text = error.localizedDescription
    }
    
}
```
