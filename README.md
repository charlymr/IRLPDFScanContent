# IRLPDFScanContent
A convenient class usable from `UIKit` view controller or `SwiftUI` to scan document & get `UIImage` or `PDFDocument` as result

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=charlymr_IRLPDFScanContent&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=charlymr_IRLPDFScanContent) [![🍎 Documentation](https://raw.githubusercontent.com/charlymr/IRLPDFScanContent/main/documentationicon.png)](https://irlpdfscancontent.irlmobile.com/documentation/)

## Overview

Use this class in to perform a scan an get images or a PDF as result

## Available

- iOS 13+

## Usage

### Add the Package to your project, min version ``5.5`` if you want to build the documentation
Add the Package to your project, min version `5.5`, See [Apple Documentation](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app).

```swift
// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
    name: "SPMDemo",
    products: [
        .library(
            name: "SPMDemo",
            targets: ["SPMDemo"]),
    ],
    dependencies: [
       .package(url: "git@github.com:charlymr/IRLPDFScanContent.git", from: "1.0.0"),
    ],
    targets: [
        .target( name: "SPMDemo",
            dependencies: [
                .product(name: "IRLPDFScanContent", package: "IRLPDFScanContent"),
        ])
    ]
)
```

## [Getting started](https://irlpdfscancontent.irlmobile.com) 

IRLPDFScanContent is a convenient way to use PDFKit in SwiftUI allowing the user to scan multiple pages and creating a PDF for you.
This tutorial guides you through building adding this functionality to a SwiftUI view. You will learn to build the view and hanlde the user input.

Chech the documentation (Essentials / Getting Started) here: [Documentation](https://irlpdfscancontent.irlmobile.com/tutorials/tutorial-table-of-contents)

#### Make it availble globaly

- In your `AppDelegate` or your Module, use `@_exported` for convenience
```swift
@_exported import IRLPDFScanContent
```

### Perfrom a Scan

- Initiate the object with [`init(with:)`](https://irlpdfscancontent.irlmobile.com) (You may pass a delegate (`IRLPDFScanContentProtocol`) or observe changes
- present you view [`present(animated:completion:)`](https://irlpdfscancontent.irlmobile.com) or [`await present(animated:)`](https://irlpdfscancontent.irlmobile.com) (iOS 15.0+)
- Observe the result of [`latestScan`](https://irlpdfscancontent.irlmobile.com) or wait for `delegate` if you used the delegate method
- Generate a PDF using [`generatePDF(with:)`](https://irlpdfscancontent.irlmobile.com) or get images using `scanImages`

``` swift
let scanner = IRLPDFScanContent(with: self)
scanner.present(animated: true, completion: nil)

// .... Later stage
guard let pdfURL = scanner.generatePDF(with: "myscan.pdf") else {
    return
}
```

## MIT License

Copyright (c) 2021 MARTIN-BRUILLOT Denis

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
