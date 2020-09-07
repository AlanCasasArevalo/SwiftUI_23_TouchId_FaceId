
import SwiftUI
// imported library https://github.com/twostraws/CodeScanner
import CodeScanner

struct ReadQR: View {

    @State private var showScanner = false
    @State private var result = ""

    var body: some View {
        VStack {
            Button(action: {
                self.showScanner = true
            }) {
                Text("Escanear QR")
            }
            .sheet(isPresented: $showScanner) {
                // En el array de tipos de codigo podemos agregar los codigos que nos apetezca y esten aceptados
                CodeScannerView(codeTypes: [.qr, .code128, .face]) { result in
                    switch result {
                    case .success(let code):
                        self.result = code
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

struct ReadQR_Previews: PreviewProvider {
    static var previews: some View {
        ReadQR()
    }
}
