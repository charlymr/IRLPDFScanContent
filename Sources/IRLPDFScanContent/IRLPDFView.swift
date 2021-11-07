//
//  File.swift
//  
//
//  Created by Denis Martin-Bruillot on 06/11/2021.
//

import SwiftUI
import PDFKit

/// A `SwiftUI` wrapper of [`PDFView`](https://developer.apple.com/documentation/pdfkit/pdfview)
public struct IRLPDFView: UIViewRepresentable {
    
    /// The URL of the PDF being display
    public let url: URL?
    
    /// The PDF being display
    public let document: PDFDocument?
    
    /// The [`PDFView`](https://developer.apple.com/documentation/pdfkit/pdfview) is accessible so you can customize it.
    public let pdfView: PDFView
    
    /// Initializer
    /// - Parameter url: The URL of the PDF to display
    public init(url: URL) {
        self.url = url
        self.document = nil
        self.pdfView = PDFView()
    }

    /// Initializer
    /// - Parameter document: The  PDF to display
    /// - Parameter pdfView: An optional [`PDFView`](https://developer.apple.com/documentation/pdfkit/pdfview) that will be use.
    public init(document: PDFDocument, pdfView: PDFView = PDFView()) {
        self.document = document
        self.url = nil
        self.pdfView = pdfView
    }

    // MARK: UIViewRepresentable implementation
    
    /// [`UIViewRepresentable`](https://developer.apple.com/documentation/swiftui/uiviewrepresentable) protocol conformance
    public func makeUIView(context: UIViewRepresentableContext<Self>) -> Self.UIViewType {
        if let document = document {
            pdfView.document = document
            
        } else if let url = url {
            pdfView.document = PDFDocument(url: url)
        }
        pdfView.autoScales = true
        return pdfView
    }

    /// [`UIViewRepresentable`](https://developer.apple.com/documentation/swiftui/uiviewrepresentable) protocol conformance
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        // Update the view.
    }
}
