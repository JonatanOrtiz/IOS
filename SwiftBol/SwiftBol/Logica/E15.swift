import SwiftUI
import Combine

struct E15: View {
  @State private var val = ""
  @State private var acceptedInputs = "-0123456789"
  
  var ant: String {
    let valInt = Int(val) ?? 0
    return String(valInt - 1)
  }
  
  var body: some View {
    Form {
      Section(header: Text("Valor")) {
        TextField("valor 1: ", text: $val)
          .onReceive(Just(val)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.val = filtered
            }
          }
      }
      Section(header: Text("Antecessor")) {
        Text("\(val != "" && val != "-" ? ant : "")")
      }
    }
  }
}

struct E15_Previews: PreviewProvider {
  static var previews: some View {
    E15()
  }
}
