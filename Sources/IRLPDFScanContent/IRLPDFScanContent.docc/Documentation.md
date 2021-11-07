# ``IRLPDFScanContent`` Getting Started
`SwiftUI` & `UKKit` - Images or PDF scanner.

## Overview
A convenient class usable from `UIKit` view controller or `SwiftUI` to scan document & get `UIImage` or `PDFDocument` as result

- This package can replace [IRLScannerViewController](https://github.com/charlymr/IRLDocumentScanner) which is now very old

- Check it out on [Github](https://github.com/charlymr/IRLPDFScanContent) 

#### To Make it availble globaly in your project

- In your `AppDelegate` or your Module, use `@_exported` for convenience
```swift
@_exported import IRLPDFScanContent
```

## Available

- iOS 13+

Check the documentation (Essentials / Getting Started) here: [Documentation](https://irlpdfscancontent.irlmobile.com/tutorials/tutorial-table-of-contents) for more details

## Migration from IRLScannerViewController
Migration from [IRLScannerViewController](https://github.com/charlymr/IRLDocumentScanner) is feasible. Please check the tutorial <doc:Migrate-from-IRLScannerViewController>

#### First you will need to replace your dependency and `import`
See <doc:GettingStarted> for the different options (SPM, Cocoapods, Carthage)

#### You project should still work with depreciation warnings
Follow the <doc:Migrate-from-IRLScannerViewController> tutorial to see how to beneficiate from the new system & remove the depreciation warnings.

One quick note, the new system support multiple scan. In this tutorial we cover how to get 1 scan. It is very straigth forward to get eveything else, check the doc.

## Topics

### Essentials

- <doc:About>
- <doc:GettingStarted>
- <doc:/tutorials/Tutorial-Table-of-Contents>
- <doc:ClassicalDelegate>
- <doc:SwiftUI>
- <doc:Migrate-from-IRLScannerViewController>

### Classes

- ``IRLPDFScanContent/IRLPDFScanContent``

### Protocols

- ``IRLPDFScanContent/IRLPDFScanContentProtocol``
- ``IRLPDFScanContent/IRLVNDocumentCameraScanAdditions``

### Protocols

- ``IRLPDFScanContent/IRLPDFScanContent``

### Structures

- ``IRLPDFScanContent/IRLPDFView``

### Legacy Migration

- ``IRLPDFScanContent/IRLScannerViewController``
- ``IRLPDFScanContent/IRLScannerViewControllerDelegate``
- ``IRLPDFScanContent/IRLScannerViewControllerVNDocumentCameraViewAdditions``

