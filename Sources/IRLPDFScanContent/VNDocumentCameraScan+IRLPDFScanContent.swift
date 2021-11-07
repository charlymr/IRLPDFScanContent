//
//  IRLVNDocumentCameraScanAdditions.swift
//  IRLPDFScanContent
//
//  Created by Denis Martin-Bruillot on 09/09/2021.
//  Copyright © 2021 Denis Martin-Bruillot. All rights reserved.
//

import PDFKit

/// A conveniant protocol adding the ability to get [UIImage](https://developer.apple.com/documentation/uikit/uiimage) or [PDFDocument](https://developer.apple.com/documentation/pdfkit/pdfdocument) from a [VNDocumentCameraScan](https://developer.apple.com/documentation/visionkit/vndocumentcamerascan)
///
public protocol IRLVNDocumentCameraScanAdditions {
    
    /// [SYNCHRONOUS] Return an array of [UIImage](https://developer.apple.com/documentation/uikit/uiimage) if the scan was performed and successfull
    ///
    ///  - Warning: This Method is synchrounous and will block the main thread for large amount of scan
    var scanImages: [UIImage]? { get }
    
    /// [ASYNCHRONOUS] Return an array of [UIImage](https://developer.apple.com/documentation/uikit/uiimage) if the scan was performed and successfull
    ///
    /// Images  will be inserted in the Array on a background threat, you can see the 1st image rigth away, the other will come on the go. When done the completion handler will be call.
    ///
    /// - Parameters:
    ///   - completion:Optional Completion Handler with 1 paramter, an Array of `UIImage` with all the images
    func scanImages(completion: (([UIImage]) -> Void)?) -> [UIImage]
    
    ///  [SYNCHRONOUS] Return the `URL` of a [PDFDocument](https://developer.apple.com/documentation/pdfkit/pdfdocument) if the scan was performed and successfull
    ///
    /// - Warning: This Method is synchrounous and will block the main thread for large amount of scan
    ///
    /// - Parameters:
    ///   - name: An name for the PDF (default: ``IRLPDFScanContent/IRLPDFScanContent/defaultPDFName``
    func generatePDF(with name: String) -> URL?
    
    /// [ASYNCHRONOUS] Return a [PDFDocument](https://developer.apple.com/documentation/pdfkit/pdfdocument) if the scan was performed and successfull
    ///
    /// PDF pages will be inserted on a background threat, you can see the 1st page rigth away, the other will come on the go. When done the completion handler will be call.
    ///
    /// - Parameters:
    ///   - name: An name for the PDF (default: ``IRLPDFScanContent/IRLPDFScanContent/defaultPDFName``
    ///   - pdfView: The [ PDFView](https://developer.apple.com/documentation/pdfkit/pdfview) use to display the pdf.
    ///   - completion:Optional Completion Handler with 2 paramter, the [ PDFView](https://developer.apple.com/documentation/pdfkit/pdfview) & `URL`) of the PDF
    func generatePDFDocument(with name: String, pdfView: PDFView?, completion: ((PDFDocument, URL) -> Void)?) -> PDFDocument?
}

public extension IRLVNDocumentCameraScanAdditions where Self: VNDocumentCameraScan {
    
    /// Return the internal path in the app Document Directory where a PDF would be save with a given name
    func scannedPDF(name: String = IRLPDFScanContent.defaultPDFName) -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory.appendingPathComponent(name)
    }
    
    /// [SYNCHRONOUS] Return an array of [UIImage](https://developer.apple.com/documentation/uikit/uiimage) if the scan was performed and successfull
    ///
    /// - Warning: This Method is synchrounous and will block the main thread for large amount of scan
    var scanImages: [UIImage]? {
        var images = [UIImage]()
        for i in 0..<self.pageCount {
            images.append(self.imageOfPage(at:i))
        }
        return images
    }
    
    /// [ASYNCHRONOUS] Return an array of [UIImage](https://developer.apple.com/documentation/uikit/uiimage) if the scan was performed and successfull
    ///
    /// Images  will be inserted in the Array on a background threat, you can see the 1st image rigth away, the other will come on the go. When done the completion handler will be call.
    ///
    /// - Parameters:
    ///   - completion:Optional Completion Handler with 1 paramter, an Array of `UIImage` with all the images
    func scanImages(completion: (([UIImage]) -> Void)? = nil) -> [UIImage] {
        guard pageCount > 0 else {
            return []
        }
        var images = [UIImage]()
        images.append(self.imageOfPage(at: 0))
        DispatchQueue.global().async {
            for i in 1..<self.pageCount {
                let imagePage = self.imageOfPage(at:i)
                images.append(imagePage)
            }
            DispatchQueue.main.async {
                completion?(images)
            }
        }
        return images
    }
    
    ///  [SYNCHRONOUS] Return the `URL` of a [PDFDocument](https://developer.apple.com/documentation/pdfkit/pdfdocument) if the scan was performed and successfull
    ///
    /// - Warning: This Method is synchrounous and will block the main thread for large amount of scan
    ///
    /// - Parameters:
    ///   - name: An name for the PDF (default: ``IRLPDFScanContent/IRLPDFScanContent/defaultPDFName``
    func generatePDF(with name: String = IRLPDFScanContent.defaultPDFName) -> URL? {
        guard pageCount > 0 else {
            return nil
        }
        let pdfDocument = PDFDocument()
        for i in 0..<self.pageCount {
            let pdfPage = PDFPage(image: self.imageOfPage(at:i))
            pdfDocument.insert(pdfPage!, at: i)
        }
        try? FileManager.default.removeItem(at: scannedPDF(name: name))
        pdfDocument.write(to: scannedPDF(name: name))
        return scannedPDF(name: name)
    }
    
    /// [ASYNCHRONOUS] Return a [PDFDocument](https://developer.apple.com/documentation/pdfkit/pdfdocument) if the scan was performed and successfull
    ///
    /// PDF pages will be inserted on a background threat, you can see the 1st page rigth away, the other will come on the go. When done the completion handler will be call.
    ///
    /// - Parameters:
    ///   - name: An name for the PDF (default: ``IRLPDFScanContent/IRLPDFScanContent/defaultPDFName``
    ///   - pdfView: The [ PDFView](https://developer.apple.com/documentation/pdfkit/pdfview) use to display the pdf.
    ///   - completion:Optional Completion Handler with 2 paramter, the [ PDFView](https://developer.apple.com/documentation/pdfkit/pdfview) & `URL`) of the PDF
    func generatePDFDocument(with name: String = IRLPDFScanContent.defaultPDFName, pdfView: PDFView? = nil, completion: ((PDFDocument, URL) -> Void)? = nil) -> PDFDocument? {
        guard pageCount > 0 else {
            return nil
        }
        let pdfDocument = PDFDocument()
        let pdfPage = PDFPage(image: self.imageOfPage(at: 0))
        pdfDocument.insert(pdfPage!, at: 0)
        pdfView?.autoScales = true
        DispatchQueue.global().async {
            for i in 1..<self.pageCount {
                let pdfPage = PDFPage(image: self.imageOfPage(at: i))
                DispatchQueue.main.async {
                    pdfDocument.insert(pdfPage!, at: i)
                }
            }
            try? FileManager.default.removeItem(at: self.scannedPDF(name: name))
            pdfDocument.write(to: self.scannedPDF(name: name))
            DispatchQueue.main.async {
                completion?(pdfDocument, self.scannedPDF(name: name))
            }
        }
        return pdfDocument
    }

    /// [ASYNCHRONOUS] Convenience allowing you to get an ``IRLPDFView`` driectly from [VNDocumentCameraScan](https://developer.apple.com/documentation/visionkit/vndocumentcamerascan)
    var swiftUIPDFView: IRLPDFView? {
        let pdfView = PDFView()
        guard let document = generatePDFDocument(pdfView: pdfView) else {
            return nil
        }
        return IRLPDFView(document: document, pdfView: pdfView)
    }

}

extension VNDocumentCameraScan: IRLVNDocumentCameraScanAdditions {
    // Make VNDocumentCameraScan  conform to our protocol
}
