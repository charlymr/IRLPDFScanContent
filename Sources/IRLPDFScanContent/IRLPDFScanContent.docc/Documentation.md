# ``IRLPDFScanContent`` Getting Started
`SwiftUI` & `UKKit` - Images or PDF scanner.

## Overview
A convenient class usable from `UIKit` view controller or `SwiftUI` to scan document & get `UIImage` or `PDFDocument` as result

- This package can replace [IRLScannerViewController](https://github.com/charlymr/IRLDocumentScanner) which is now very old

- Check the code & version on [Github](https://github.com/charlymr/IRLPDFScanContent) 

#### To Make it availble globaly in your project

- In your `AppDelegate` or your Module, use `@_exported` for convenience
```swift
@_exported import IRLPDFScanContent
```

## Available

- iOS 13+

The code is well documented & offer tutorials: (Essentials / Getting Started) here: [Documentation](https://irlpdfscancontent.irlmobile.com/tutorials/tutorial-table-of-contents) for more details

## Migration from IRLScannerViewController
Migration from [IRLScannerViewController](https://github.com/charlymr/IRLDocumentScanner) is feasible. Please check the tutorial <doc:Migrate-from-IRLScannerViewController>

#### First you will need to replace your dependency and **import**
See <doc:GettingStarted> for the different options such as SPM, Cocoapods, Carthage.

#### You project should still work with depreciation ⚠️
To migrate your code, follow the <doc:Migrate-from-IRLScannerViewController> tutorial to see how to beneficiate from the new system & remove the depreciation warnings.

ℹ️ Quick note: The new system support multiple scans & PDF. In this tutorial we cover how to get 1 scan. It is very straigth forward to get eveything else!

## Topics

### Essentials

- <doc:/tutorials/Tutorial-Table-of-Contents>
- <doc:About>
- <doc:GettingStarted>
- <doc:ClassicalDelegate>
- <doc:SwiftUI>

### Classes

- ``IRLPDFScanContent/IRLPDFScanContent``

### Protocols

- ``IRLPDFScanContent/IRLPDFScanContentProtocol``
- ``IRLPDFScanContent/IRLVNDocumentCameraScanAdditions``

### Structures

- ``IRLPDFScanContent/IRLPDFView``

### Legacy

- ``IRLPDFScanContent/IRLScannerViewController``
- ``IRLPDFScanContent/IRLScannerViewControllerDelegate``
- ``IRLPDFScanContent/IRLScannerViewControllerVNDocumentCameraViewAdditions``

