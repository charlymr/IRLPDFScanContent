# Installation

A convenient class usable from `UIKit` view controller or `SwiftUI` to scan document & get `UIImage` or `PDFDocument` as result

## Overview

Use this class in to perform a scan and get images or a PDF as result.

**MINIMUM iOS REQUIREMENT: 13.0**

Integration of this Library can be done using SPM, Cocoapods, Carthage or you can download the code and drop the "Sources/IRLPDFScaContent" to your project. 

📚 If you drop the source code from "Sources/IRLPDFScaContent", you may want to remove the ``IRLPDFScanContent``.docc folder as the documentation is intended to be nuidl for a Module.

## Info.plist requirement

As of iOS 10, you must povide a reason for using the camera in you Info.plist:
Please add the following to your plist:
**[NSCameraUsageDescription](https://developer.apple.com/documentation/bundleresources/information_property_list/nscamerausagedescription) : We need the camera to scan**

## Swift Package
Integrate the library via Swift Package (With Documentation)

#### In Xcode

Add the Package to your project, min version `5.5`, See [Apple Documentation](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app) for more details.

#### Manually

Create a Package.swift in a folder, then Drop the file on Xcode

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
       .package(url: "git@github.com:charlymr/IRLPDFScanContent.git", from: "1.1.0"),
    ],
    targets: [
        .target( name: "SPMDemo",
            dependencies: [
                .product(name: "IRLPDFScanContent", package: "IRLPDFScanContent"),
        ])
    ]
)
```

## CocoaPods
Integrate the library via CocoaPods

#### Install CocoaPods 
if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```

#### Update your Podfile 
Change to the directory of your Xcode project, and Create and Edit your Podfile and add ``IRLPDFScanContent``:

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

#### Prepare project
run `pod update` or `pod install` to generate the Workspace

``` bash
$ pod update
```

## Carthage
Integrate the library via Carthage.
For more details on Cartage and how to use it, check the [Carthage Github](https://github.com/Carthage/Carthage) documentation

#### Install Carthage
Install [Carthage](https://github.com/Carthage/Carthage#installing-carthage) if not already available 

#### Update your CartFile 
Change to the directory of your Xcode project, and Create and Edit your CartFile and add ``IRLPDFScanContent``:

``` bash
$ cd /path/to/MyProject
$ touch CartFile
## edit CartFile:

github "charlymr/IRLPDFScanContent" ~> 1.1.0
```

#### Prepare
``` bash
$ carthage update --use-xcframeworks 
```
Drop the Carthage/Build/iOS `.xcframework` in your project.



