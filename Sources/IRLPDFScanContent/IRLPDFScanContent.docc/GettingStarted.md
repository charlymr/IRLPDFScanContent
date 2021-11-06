# Getting Started

A convenient class usable from `UIKit` view controller or `SwiftUI` to scan document & get `UIImage` or `PDFDocument` as result

## Overview

Here is a brief overview of how you can perform a scan, all in `SwiftUI`

### (Optional) Make it availble globaly

- In your `AppDelegate` or your Module, use `@_exported` for convenience
```swift
@_exported import IRLPDFScanContent
```

### Prepare your App

As we will be using the camera, Apple require to provide a reason.

- Warning: Add the key `NSCameraUsageDescription` to your `Info.plist` with a description of why you need to use the camera. 

### Perfrom a Scan

- Initiate the object with [`init(with:)`](https://irlpdfscancontent.irlmobile.com/documentation/irlpdfscancontent/irlpdfscancontent/init(with:)) (You may pass a delegate (`IRLPDFScanContentProtocol`) or observe changes
- present you view [`present(animated:completion:)`](https://irlpdfscancontent.irlmobile.com/documentation/irlpdfscancontent/irlpdfscancontent/present(animated:completion:)) or [`await present(animated:)`](https://irlpdfscancontent.irlmobile.com/documentation/irlpdfscancontent/irlpdfscancontent/present(animated:)) (iOS 15.0+)
- Observe the result of [`latestScan`](https://irlpdfscancontent.irlmobile.com/documentation/irlpdfscancontent/irlpdfscancontent/latestscan)) or wait for `delegate` if you used the delegate method
- in a ViewController: Generate a PDF using [`generatePDF(with:)`](https://irlpdfscancontent.irlmobile.com/documentation/irlpdfscancontent/irlpdfscancontent/generatepdf(with:)) or get images using `scanImages`
- in `SwiftUI`, you can simply use the convenient ``IRLVNDocumentCameraScanAdditions/swiftUIPDFView`` to display a `PDFView`

- Warning: This code is intended to be run on a Device.

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

```
