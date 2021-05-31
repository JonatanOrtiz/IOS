import SwiftUI
import Combine

struct E21: View {
  @State private var acceptedInputs = ".0123456789"
  @State private var originalValue = ""
  
  var newValue: Double {
    let oD = Double(originalValue) ?? 0
    return oD * (1 + (0.45 + 0.28))
  }
  
  var body: some View {
    Form {
      Section(header: Text("Valor de fábrica")) {
        TextField("Valor", text: $originalValue)
          .onReceive(Just(originalValue)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.originalValue = filtered
            }
          }
      }
      Section(header: Text("Valor final")) {
        Text("\(newValue, specifier: "%.2f")")
      }
    }
  }
}

struct E21_Previews: PreviewProvider {
  static var previews: some View {
    E21()
  }
}
