//
//  IRLPDFScanContent+VNDocumentCameraViewControllerDelegate.swift
//  IRLPDFScanContent
//
//  Created by Denis Martin-Bruillot on 09/09/2021.
//  Copyright © 2021 Denis Martin-Bruillot. All rights reserved.
//

/// Comformance to the delegate protocol through which the document camera returns its scanned results.
extension IRLPDFScanContent: VNDocumentCameraViewControllerDelegate {

    /// Inherited from VNDocumentCameraViewControllerDelegate.documentCameraViewControllerDidCancel(_:).
    public func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        reset()
        controller.dismiss(animated: true) {
            self.delegate?.scanContentDissmissed(caller: self)
        }
    }
    
    /// Inherited from VNDocumentCameraViewControllerDelegate.documentCameraViewController(_:didFailWithError:).
    public func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        reset()
        self.errorMessage = error.localizedDescription
        delegate?.scanContent(caller: self, didFail: error)
    }
    
    /// Inherited from VNDocumentCameraViewControllerDelegate.documentCameraViewController(_:didFinishWith:).
    public func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        latestScan = scan
        delegate?.scanContent(caller: self, didScan: scan)
        controller.dismiss(animated: true) {
            self.delegate?.scanContentDissmissed(caller: self)
        }
    }
    
}

