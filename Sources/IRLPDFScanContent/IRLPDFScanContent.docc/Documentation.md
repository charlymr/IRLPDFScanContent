# ``IRLPDFScanContent`` Getting Started

A convenient class usable from `UIKit` view controller or `SwiftUI` to scan document & get `UIImage` or `PDFDocument` as result

## Overview

- Use this class in to perform a scan an get the PDF or images as result.

- Check it out on [Github](https://github.com/charlymr/IRLPDFScanContent) 

## Available

- iOS 13+

## Usage

### Add the Package to your project, min version `5.5` if you want to build the documentation
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

## Topics

### Essentials

- <doc:/tutorials/Tutorial-Table-of-Contents>
- <doc:GettingStarted>
