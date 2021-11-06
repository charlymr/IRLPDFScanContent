# IRLPDFScanContent
`SwiftUI` & `UKKit` - Images or PDF scanner.

[![🍎 Documentation](https://raw.githubusercontent.com/charlymr/IRLPDFScanContent/main/documentationicon.png)](https://irlpdfscancontent.irlmobile.com/documentation/) [![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=charlymr_IRLPDFScanContent&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=charlymr_IRLPDFScanContent) [![Version](https://img.shields.io/cocoapods/v/IRLPDFScanContent.svg?style=flat)](http://cocoapods.org/pods/IRLPDFScanContent) [![Platform](https://img.shields.io/cocoapods/p/IRLPDFScanContent.svg?style=flat)](http://cocoapods.org/pods/IRLPDFScanContent) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![licence MIT](https://shields.io/badge/license-MIT-%23373737)](https://github.com/charlymr/IRLPDFScanContent/blob/main/LICENSE)

## Overview

A convenient class usable from `UIKit` view controller or `SwiftUI` to scan document & get `UIImage` or `PDFDocument` as result

**MINIMUM iOS REQUIREMENT: 13.0**

## Application plist requirement

As of iOS 10, you must povide a reason for using the camera in you Info.plist:
Please add the following to your plist:
**[NSCameraUsageDescription](https://developer.apple.com/documentation/bundleresources/information_property_list/nscamerausagedescription) : We need the camera to scan**

## Install

### via Swift Package (With Documentation)

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

### via CocoaPods

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```

Change to the directory of your Xcode project, and Create and Edit your Podfile and add IRLPDFScanContent:

``` bash
$ cd /path/to/MyProject
$ touch Podfile
## edit Podfile:

platform :ios, '13.0'

target "YOUR APP" do
    pod 'IRLPDFScanContent'
    use_frameworks!
end
```

### via Carthage

Install [Carthage](https://github.com/Carthage/Carthage#installing-carthage) if not already available 

Change to the directory of your Xcode project, and Create and Edit your Podfile and add IRLPDFScanContent:

``` bash
$ cd /path/to/MyProject
$ touch CartFile
## edit CartFile:

github "charlymr/IRLPDFScanContent" ~> 1.0.1
```

Save and run:
``` bash
$ carthage update --use-xcframeworks 
```
Drop the Carthage/Build/iOS .framework in your project.

For more details on Cartage and how to use it, check the [Carthage Github](https://github.com/Carthage/Carthage) documentation


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

## Authors

- Denis Martin | Web: [www.irlmobile.com](http://www.irlmobile.com)
- 
## Open Source

- Feel free to fork and modify this code. Pull requests are more than welcome!

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
