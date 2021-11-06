# Getting Started

A convenient class usable from `UIKit` view controller or `SwiftUI` to scan document & get `UIImage` or `PDFDocument` as result

## Overview

Use this class in to perform a scan and get images or a PDF as result.

**MINIMUM iOS REQUIREMENT: 13.0**

## Application plist requirement

As of iOS 10, you must povide a reason for using the camera in you Info.plist:
Please add the following to your plist:
**[NSCameraUsageDescription](https://developer.apple.com/documentation/bundleresources/information_property_list/nscamerausagedescription) : We need the camera to scan**

## Usage

### Swift Package (With Documentation)
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

###  CocoaPods

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```

Change to the directory of your Xcode project, and Create and Edit your Podfile and add IRLPDFScanContent:

``` bash
$ cd /path/to/MyProject
$ touch Podfile
$ edit Podfile

platform :ios, '13.0'

target "YOUR APP" do
pod 'IRLPDFScanContent'
use_frameworks!
end
```

## [Getting started](https://irlpdfscancontent.irlmobile.com) 

IRLPDFScanContent is a convenient way to use PDFKit in SwiftUI allowing the user to scan multiple pages and creating a PDF for you.
This tutorial guides you through building adding this functionality to a SwiftUI view. You will learn to build the view and hanlde the user input.

Check the documentation (Essentials / Getting Started) here: [Documentation](https://irlpdfscancontent.irlmobile.com/tutorials/tutorial-table-of-contents)

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
