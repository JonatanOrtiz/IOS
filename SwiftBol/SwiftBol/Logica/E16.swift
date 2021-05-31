import SwiftUI
import Combine

struct E16: View {
  @State private var b = ""
  @State private var a = ""
  @State private var acceptedInputs = ".-0123456789"
  
  var area: String {
    let bDouble = Double(b) ?? 0
    let aDouble = Double(a) ?? 0
    return String(bDouble * aDouble)
  }
  
  var body: some View {
    Form {
      Section(header: Text("Valores")) {
        TextField("Base", text: $b)
          .onReceive(Just(b)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.b = filtered
            }
          }
        TextField("Altura", text: $a)
          .onReceive(Just(a)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.a = filtered
            }
          }
      }
      Section(header: Text("Area")) {
        Text("\(area)")
      }
    }
  }
}

struct E16_Previews: PreviewProvider {
  static var previews: some View {
    E16()
  }
}
