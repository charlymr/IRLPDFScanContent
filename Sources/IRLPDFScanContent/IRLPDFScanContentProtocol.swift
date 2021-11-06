//
//  IRLPDFScanContentProtocol.swift
//  IRLPDFScanContent
//
//  Created by Denis Martin-Bruillot on 09/09/2021.
//  Copyright © 2021 Denis Martin-Bruillot. All rights reserved.
//

/// Delegate responding to various events from ``IRLPDFScanContent/IRLPDFScanContent``
public protocol IRLPDFScanContentProtocol {
    
    /// Call when the Scanner UI successfuly  perfromed the scan
    ///
    /// - You may now use or store the [VNDocumentCameraScan](https://developer.apple.com/documentation/visionkit/vndocumentcamerascan)  and use at your convenience ``IRLPDFScanContent/IRLVNDocumentCameraScanAdditions/generatePDF(with:)-7wexb`` or ``IRLPDFScanContent/IRLVNDocumentCameraScanAdditions/scanImages-17r9d``
    ///
    /// - You can also get the result directly from the caller using ``IRLPDFScanContent/IRLPDFScanContent/generatePDF(with:)`` or ``IRLPDFScanContent/IRLPDFScanContent/scanImages``
    ///
    /// - Parameters:
    ///   - caller: Your ``IRLPDFScanContent/IRLPDFScanContent`` instance
    ///   - scan: The  [VNDocumentCameraScan](https://developer.apple.com/documentation/visionkit/vndocumentcamerascan)  retrurned from the scanner
    func scanContent(caller: IRLPDFScanContent, didScan scan: VNDocumentCameraScan)
    
    /// Call if the Scanner UI failed
    /// - Parameters:
    ///   - caller: Your ``IRLPDFScanContent/IRLPDFScanContent`` instance
    ///   - error: The `Error` retrurned from the scanne
    func scanContent(caller: IRLPDFScanContent, didFail error: Error)

    /// Call after the Scanner UI has been presented
    /// - Parameters:
    ///   - caller: Your ``IRLPDFScanContent/IRLPDFScanContent`` instance
    ///   - viewController: The `UIViewController` it was presented from. (Discovered automatically from the main window or scene
    func scanContentDidPresent(caller: IRLPDFScanContent, in viewController: UIViewController)
    
    /// Call after the Scanner UI was dissmissed
    /// - Parameters:
    ///   - caller: Your ``IRLPDFScanContent/IRLPDFScanContent`` instance
    func scanContentDissmissed(caller: IRLPDFScanContent)

}

public extension IRLPDFScanContentProtocol {
    
    func scanContentDidPresent(caller: IRLPDFScanContent, in viewController: UIViewController) {
        /// Make it optional
    }

    func scanContentDissmissed(caller: IRLPDFScanContent) {
        /// Make it optional
    }
}
