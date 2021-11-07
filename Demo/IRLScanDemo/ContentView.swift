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
        
    var body: some View {
        NavigationView {
            VStack() {
                 if let latestScan = scanner.latestScan {
                    latestScan.swiftUIPDFView
                    
                } else {
                    Text("Press the Scan button")
                }
            }
            .padding()
            .navigationBarItems(trailing: Button("Scan", action: {
                scanner.present(animated: true, completion: nil)
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
