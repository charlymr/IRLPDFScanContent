//
//  IRLPDFScanContent+Internal.swift
//  IRLPDFScanContent
//
//  Created by Denis Martin-Bruillot on 09/09/2021.
//  Copyright © 2021 Denis Martin-Bruillot. All rights reserved.
//

extension IRLPDFScanContent {

    func getDocumentCameraViewController() -> VNDocumentCameraViewController {
        let vc = VNDocumentCameraViewController()
        vc.delegate = self
        return vc
    }
}
