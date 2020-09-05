
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
        Text("Pulsa para acceder al menu")
            .contextMenu {
                VStack {
                    NavigationLink(destination: CreateQR()) {
                        Text("Crear QR")
                    }
                    NavigationLink(destination: ReadQR()) {
                        Text("Leer QR")
                    }
                }
            .navigationBarTitle("Lector QR")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
