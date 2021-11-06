# ``IRLPDFScanContent``

A convenient class usable from `UIKit` view controller or `SwiftUI` to scan document & get `UIImage` or `PDFDocument` as result

## Overview

Use this class in to perform a scan an get the PDF or images as result

### Usage:
1. initiate the object ``IRLPDFScanContent/IRLPDFScanContent/init(with:)`` (You may pass a delegate(``IRLPDFScanContent/IRLPDFScanContentProtocol``) or observe changes
2. present you view ``IRLPDFScanContent/IRLPDFScanContent/present(animated:completion:)`` or  await ``IRLPDFScanContent/IRLPDFScanContent/present(animated:)``
3. Observe the result of ``IRLPDFScanContent/IRLPDFScanContent/latestScan`` or wait for ``IRLPDFScanContent/IRLPDFScanContent/delegate``you used the delegate method
4. Generate a PDF using ``IRLPDFScanContent/IRLPDFScanContent/generatePDF(with:)``  or  get images using  ``IRLPDFScanContent/IRLPDFScanContent/scanImages``

