import SwiftUI
import Combine

struct E81: View {
  @State private var acceptedInputs = ",.0123456789"
  @State private var vetor = ""
  @State private var lowest = 0.0
  @State private var highest = 0.0
  
  func verification() {
    let array = vetor.split(separator: ",")
    let arrayD = array.compactMap { Double($0) }
    lowest = arrayD.min() ?? 0
    highest = arrayD.max() ?? 0
  }
  
  var body: some View {
    Form {
      Section(header: Text("Vetor")) {
        TextField("Separar números por vírgulas", text: $vetor)
          .onReceive(Just(vetor)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.vetor = filtered
            }
          }
      }
      Button(action: verification, label: {
        Text("Verificar")
      })
      Section(header: Text("Verificado")) {
        Text("Menor: \(lowest, specifier: "%.2f")")
        Text("Maior: \(highest, specifier: "%.2f")")
      }
    }
  }
}

struct E81_Previews: PreviewProvider {
  static var previews: some View {
    E81()
  }
}
