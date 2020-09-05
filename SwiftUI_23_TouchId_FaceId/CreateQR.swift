
import SwiftUI
import CoreImage.CIFilterBuiltins

struct CreateQR: View {
    
    @State private var textToCoding = ""
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        VStack (alignment: .center, spacing: 20) {
            TextField("Texto a codificar", text: $textToCoding)
                .padding(.bottom)
            Image(uiImage: qrGenerator(textToCoding: textToCoding) ?? UIImage())
                .interpolation(.high)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 250, alignment: .center)
        }
        .padding(16)
    }
}

extension CreateQR {
    func qrGenerator (textToCoding: String) -> UIImage? {
        let data = Data(textToCoding.utf8)
        // La key en este caso es importante para que funcione que sea inputMessage
        filter.setValue(data, forKey: "inputMessage")
        
        if let outputImage = filter.outputImage, let image = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: image)
        }
        
        return nil
    }
}

struct CreateQR_Previews: PreviewProvider {
    static var previews: some View {
        CreateQR()
    }
}
