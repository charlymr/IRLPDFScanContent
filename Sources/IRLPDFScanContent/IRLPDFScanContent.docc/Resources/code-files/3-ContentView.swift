import SwiftUI
import IRLPDFScanContent

struct ContentView: View {
    
    @ObservedObject var scanner: IRLPDFScanContent = IRLPDFScanContent()
    
    var body: some View {
        NavigationView {
            Text("Press the Scan button")
                .padding()
                .navigationBarItems(trailing: Button("Scan", action: {
                    
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
