import SwiftUI

struct E14: View {
  @State private var a = ""
  @State private var b = ""
  @State private var mod = 0
  
  func modCalc() {
    let x = Int(a) ?? 0
    let y = Int(b) ?? 0
    mod = x % y
  }

    var body: some View {
      Form {
        Section(header: Text("Informe os valores")) {
          TextField("Valor 1: ", text: $a)
          TextField("Valor 2: ", text: $b)
        }
        Button(action: self.modCalc, label: {
          Text("Calcular")
        })
        Section(header: Text("MOD")) {
          Text("\(mod)")
        }
      }
    }
}

struct E14_Previews: PreviewProvider {
    static var previews: some View {
        E14()
    }
}
