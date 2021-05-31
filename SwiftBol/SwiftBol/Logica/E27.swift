import SwiftUI
import Combine

struct E27: View {
  @State private var acceptedInputs = "0123456789"
  @State private var p = ""
  @State private var m = ""
  @State private var g = ""
  @State private var total = 0
  
  func percentageCalc() {
    let pD = Int(p) ?? 0
    let mD = Int(m) ?? 0
    let gD = Int(g) ?? 0
    total = (pD * 10) + (mD * 12) + (gD * 15)
  }
  
  var body: some View {
    Form {
      Section(header: Text("Quantidade de camisetas")) {
        TextField("P", text: $p)
          .onReceive(Just(p)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.p = filtered
            }
          }
        TextField("M", text: $m)
          .onReceive(Just(m)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.m = filtered
            }
          }
        TextField("G", text: $g)
          .onReceive(Just(g)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.g = filtered
            }
          }
      }
      Button(action: percentageCalc, label: {
        Text("Calcular")
      })
      Section(header: Text("Total")) {
        Text("\(total)")
      }
    }
  }
}

struct E27_Previews: PreviewProvider {
  static var previews: some View {
    E27()
  }
}
