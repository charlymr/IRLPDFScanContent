//
//  IRLScannerViewControllerDelegation.swift
//  IRLPDFScanContent
//
//  Created by Denis Martin-Bruillot on 07/11/2021.
//

import VisionKit

@available(*, deprecated, message: "Should be replaced by `IRLPDFScanContent`")
internal let sharedDelegationScannerViewController = IRLScannerViewControllerDelegation()

@available(*, deprecated, message: "Should be replaced by `IRLPDFScanContent`")
internal class IRLScannerViewControllerDelegation: NSObject, VNDocumentCameraViewControllerDelegate {
    
    internal var cameraDelegate: IRLScannerViewControllerDelegate? = nil

    public func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard let image = scan.scanImages(completion: nil).first else {
            return
        }
        cameraDelegate?.pageSnapped(image, from: controller)
        cameraDelegate?.scanContent(caller: IRLPDFScanContent(), didScan: scan)
    }

    
    public func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        cameraDelegate?.didCancel(controller)
        cameraDelegate?.cameraViewCancelRequested(controller)
        cameraDelegate?.scanContentDissmissed(caller: IRLPDFScanContent())
    }

    
    public func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        cameraDelegate?.didCancel(controller)
        cameraDelegate?.cameraViewCancelRequested(controller)
    }
    
}
