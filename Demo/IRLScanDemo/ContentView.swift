//
//  ContentView.swift
//  IRLScanDemo
//
//  Created by Denis Martin-Bruillot on 06/11/2021.
//

import SwiftUI
import IRLPDFScanContent

struct ContentView: View {
    
    @ObservedObject var scanner: IRLPDFScanContent = IRLPDFScanContent()
    
    @State var pdfView: IRLPDFView? = nil
    
    var body: some View {
        NavigationView {
            VStack() {
                if let pdfView = pdfView {
                    pdfView
                } else {
                    Text("Press the Scan button")
                }
            }
            .padding()
            .navigationBarItems(trailing: Button("Scan", action: {
                Task {
                    await scanner.present(animated: true)
                }
            }))
            .onChange(of: scanner.latestScan) { newValue in
                pdfView = newValue?.swiftUIPDFView
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
