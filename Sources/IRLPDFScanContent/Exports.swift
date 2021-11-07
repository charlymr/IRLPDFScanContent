//
//  Exports.swift
//  IRLPDFScanContent
//
//  Created by Denis Martin-Bruillot on 09/09/2021.
//  Copyright © 2021 Denis Martin-Bruillot. All rights reserved.
//

@_exported import UIKit
@_exported import PDFKit
@_exported import VisionKit

/// IRLPDFScanContent Versionioning
public enum IRLPDFScanContentVersion: String {
    
    /// Major Versions
    case v1 = "1"
    
    /// Minor Versions
    case v1_0 = "1.0"
    case v1_1 = "1.1"

    /// Patch Versions
    case v1_0_0 = "1.0.0"
    case v1_0_1 = "1.0.1"
    case v1_0_2 = "1.0.2"
    case v1_1_0 = "1.1.0"

}
