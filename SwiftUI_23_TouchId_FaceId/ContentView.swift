
import SwiftUI
import LocalAuthentication

struct ContentView: View {
    
    @State private var unlock = false
    
    var body: some View {
        return Group {
            if unlock {
                HomeView()
            } else {
                Text("Bloqueado no puedes pasar")
            }
        }
    .onAppear(perform: authentication)
    }
}

extension ContentView {
    func authentication () {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Necesitamos autenticacion para poder ir a la home"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, error) in
                DispatchQueue.main.async {
                    if success {
                        self.unlock = true
                    } else {
                        print("No funciono la autenticacion ")
                    }
                }
            }
        } else {
            print("No tiene ningun login biometrico")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
