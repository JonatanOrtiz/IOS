import SwiftUI
import Combine

struct E28: View {
  @State private var acceptedInputs = ".0123456789"
  @State private var total = ""
  @State private var carlos = 0.0
  @State private var andre = 0.0
  @State private var felipe = 0.0
  
  func calc() {
    let totalInt = Double(total) ?? 0
    carlos = floor(totalInt/3) + ((totalInt/3 - floor(totalInt/3)) * 3)
    andre = floor(totalInt/3)
    felipe = floor(totalInt/3)
  }
  
  var body: some View {
    Form {
      Section(header: Text("Total da conta")) {
        TextField("Valor", text: $total)
          .onReceive(Just(total)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.total = filtered
            }
          }
      }
      Button(action: calc, label: {
        Text("Calcular")
      })
      Section(header: Text("Total de dias")) {
        Text("Carlos: \(carlos, specifier: "%.2f")")
        Text("André: \(andre, specifier: "%.0f")")
        Text("Felipe: \(felipe, specifier: "%.0f")")
      }
    }
  }
}

struct E28_Previews: PreviewProvider {
  static var previews: some View {
    E28()
  }
}
