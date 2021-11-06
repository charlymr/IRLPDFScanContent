//
//  File.swift
//  
//
//  Created by Denis Martin-Bruillot on 06/11/2021.
//

import SwiftUI

/// A `SwiftUI` wrapper of [`PDFView`](https://developer.apple.com/documentation/pdfkit/pdfview)
public struct IRLPDFView: UIViewRepresentable {
    
    /// The URL of the PDF being display
    public let url: URL
    
    /// The [`PDFView`](https://developer.apple.com/documentation/pdfkit/pdfview) is accessible so you can customize it.
    public let pdfView = PDFView()
    
    /// Initializer
    /// - Parameter url: The URL of the PDF to display
    public init(url: URL) {
        self.url = url
    }

    // MARK: UIViewRepresentable implementation
    
    /// [`UIViewRepresentable`](https://developer.apple.com/documentation/swiftui/uiviewrepresentable) protocol conformance
    public func makeUIView(context: UIViewRepresentableContext<Self>) -> Self.UIViewType {
        pdfView.document = PDFDocument(url: self.url)
        pdfView.autoScales = true
        return pdfView
    }

    /// [`UIViewRepresentable`](https://developer.apple.com/documentation/swiftui/uiviewrepresentable) protocol conformance
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        // Update the view.
    }
}
