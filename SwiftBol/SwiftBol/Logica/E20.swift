import SwiftUI
import Combine

struct E20: View {
  @State private var acceptedInputs = ".0123456789"
  @State private var dolar = ""
  
  var real: Double {
    let dD = Double(dolar) ?? 0
    return dD * 6.61
  }
  
  var body: some View {
    Form {
      Section(header: Text("Dolar")) {
        TextField("Valor", text: $dolar)
          .onReceive(Just(dolar)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.dolar = filtered
            }
          }
      }
      Section(header: Text("Real")) {
        Text("\(real, specifier: "%.2f")")
      }
    }
  }
}

struct E20_Previews: PreviewProvider {
  static var previews: some View {
    E20()
  }
}
