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
                    Text("Hello World")
                }
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
