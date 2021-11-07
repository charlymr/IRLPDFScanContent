# SwiftUI

``IRLPDFScanContent`` has a convenient way to use `PDFKit` in SwiftUI allowing the user to scan multiple pages and creating a PDF for you.

## Overview

In a nutshell, the ``IRLPDFScanContent/IRLPDFScanContent`` is independant and will publish changes to ``IRLPDFScanContent/IRLPDFScanContent/latestScan`` or ``IRLPDFScanContent/IRLPDFScanContent/errorMessage``  

Check the <doc:/tutorials/Tutorial-Table-of-Contents> tutorial for a Step-by-Step integration

## Perfrom a Scan

- Initiate the object with ``IRLPDFScanContent/IRLPDFScanContent/init(with:)``
- present you view `await` ``IRLPDFScanContent/IRLPDFScanContent/present(animated:)`` (iOS 15.0+)
- Observe the result of ``IRLPDFScanContent/IRLPDFScanContent/latestScan``
- Use the convenient method ``IRLPDFScanContent/IRLVNDocumentCameraScanAdditions/swiftUIPDFView`` to update your view

``` swift
import SwiftUI
import IRLPDFScanContent

struct ContentView: View {
    
    @ObservedObject var scanner: IRLPDFScanContent = IRLPDFScanContent()
        
    var body: some View {
        NavigationView {
            VStack() {
                 if let latestScan = scanner.latestScan {
                    latestScan.swiftUIPDFView
                    
                } else {
                    Text("Press the Scan button")
                }
            }
            .padding()
            .navigationBarItems(trailing: Button("Scan", action: {
                scanner.present(animated: true, completion: nil)
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

```

