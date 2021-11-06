//
//  IRLVNDocumentCameraScanAdditions.swift
//  IRLPDFScanContent
//
//  Created by Denis Martin-Bruillot on 09/09/2021.
//  Copyright © 2021 Denis Martin-Bruillot. All rights reserved.
//

/// A conveniant protocol adding the ability to get [UIImage](https://developer.apple.com/documentation/uikit/uiimage) or [PDFDocument](https://developer.apple.com/documentation/pdfkit/pdfdocument) from a [VNDocumentCameraScan](https://developer.apple.com/documentation/visionkit/vndocumentcamerascan)
///
public protocol IRLVNDocumentCameraScanAdditions {
    
    /// Return an array of [UIImage](https://developer.apple.com/documentation/uikit/uiimage) if the scan was performed and successfull
    var scanImages: [UIImage]? { get }
    
    /// Return the `URL` of a [PDFDocument](https://developer.apple.com/documentation/pdfkit/pdfdocument) if the scan was performed and successfull
    /// - Parameters:
    ///   - name: An name for the PDF (default: ``IRLPDFScanContent/IRLPDFScanContent/defaultPDFName``
    func generatePDF(with name: String) -> URL?
}

public extension IRLVNDocumentCameraScanAdditions where Self: VNDocumentCameraScan {
    
    /// Return the internal path in the app Document Directory where a PDF would be save with a given name
    func scannedPDF(name: String = IRLPDFScanContent.defaultPDFName) -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory.appendingPathComponent(name)
    }
    
    /// Return an array of [UIImage](https://developer.apple.com/documentation/uikit/uiimage) if the scan was performed and successfull
    var scanImages: [UIImage]? {
        var images = [UIImage]()
        for i in 0..<self.pageCount {
            images.append(self.imageOfPage(at:i))
        }
        return images
    }
    
    /// Return the `URL` of a [PDFDocument](https://developer.apple.com/documentation/pdfkit/pdfdocument) if the scan was performed and successfull
    /// - Parameters:
    ///   - name: An name for the PDF (default: ``IRLPDFScanContent/IRLPDFScanContent/defaultPDFName``
    func generatePDF(with name: String = IRLPDFScanContent.defaultPDFName) -> URL? {
        let pdfDocument = PDFDocument()
        for i in 0..<self.pageCount {
            let pdfPage = PDFPage(image: self.imageOfPage(at:i))
            pdfDocument.insert(pdfPage!, at: i)
        }
        try? FileManager.default.removeItem(at: scannedPDF(name: name))
        pdfDocument.write(to: scannedPDF(name: name))
        return scannedPDF(name: name)
    }
       
    /// Convenience allowing you to get an ``IRLPDFView`` driectly from [VNDocumentCameraScan](https://developer.apple.com/documentation/visionkit/vndocumentcamerascan)
    var swiftUIPDFView: IRLPDFView? {
        guard let url = generatePDF() else {
            return nil
        }
        return IRLPDFView(url: url)
    }
    
}

extension VNDocumentCameraScan: IRLVNDocumentCameraScanAdditions {
    // Make VNDocumentCameraScan  conform to our protocol
}
