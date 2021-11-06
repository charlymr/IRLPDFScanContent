# SwiftUI

``IRLPDFScanContent`` has a convenient way to use `PDFKit` in SwiftUI allowing the user to scan multiple pages and creating a PDF for you.

## Overview

Check the documentation (Essentials / Getting Started) here: [Documentation](https://irlpdfscancontent.irlmobile.com/tutorials/tutorial-table-of-contents)

### Perfrom a Scan

- Initiate the object with ``IRLPDFScanContent/IRLPDFScanContent/init(with:)``
- present you view `await` ``IRLPDFScanContent/IRLPDFScanContent/present(animated:)`` (iOS 15.0+)
- Observe the result of ``IRLPDFScanContent/IRLPDFScanContent/latestScan``
- Use the convenient method ``IRLPDFScanContent/IRLVNDocumentCameraScanAdditions/swiftUIPDFView`` to update your view

``` swift
import SwiftUI
import IRLPDFScanContent

struct ContentView: View {
    @ObservedObject var scanner: IRLPDFScanContent = IRLPDFScanContent()
    @State var pdfView: IRLPDFView? = nil
    var body: some View {
        NavigationView {
            VStack() {
                if let pdfView = pdfView {
                    pdfView
                } else {
                    Text("Press the Scan button")
                }
            }
            .padding()
            .navigationBarItems(trailing: Button("Scan", action: {
                Task {
                    await scanner.present(animated: true)
                }
            }))
            .onChange(of: scanner.latestScan) { newValue in
                pdfView = newValue?.swiftUIPDFView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

