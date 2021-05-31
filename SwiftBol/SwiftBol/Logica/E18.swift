import SwiftUI
import Combine

struct E18: View {
  @State private var acceptedInputs = "0123456789"
  @State private var blank = ""
  @State private var null = ""
  @State private var valid = ""
  @State private var blankPer = 0.0
  @State private var nullPer = 0.0
  @State private var validPer = 0.0
  
  func percentageCalc() {
    let bD = Double(blank) ?? 0
    let nD = Double(null) ?? 0
    let vD = Double(valid) ?? 0
    let total = bD + nD + vD
    blankPer = bD / total * 100
    nullPer = nD / total * 100
    validPer = vD / total * 100
  }
  
  var body: some View {
    Form {
      Section(header: Text("Número de votos")) {
        TextField("Votos brancos: ", text: $blank)
          .onReceive(Just(blank)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.blank = filtered
            }
          }
        TextField("Votos nulos: ", text: $null)
          .onReceive(Just(null)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.null = filtered
            }
          }
        TextField("Votos válidos: ", text: $valid)
          .onReceive(Just(valid)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.valid = filtered
            }
          }
      }
      Button(action: percentageCalc, label: {
        Text("Calcular")
      })
      Section(header: Text("Porcentagem")) {
        Text("Brancos: \(blankPer, specifier: "%.2f")%")
        Text("Nulos: \(nullPer, specifier: "%.2f")%")
        Text("Válidos: \(validPer, specifier: "%.2f")%")
      }
    }
  }
}

struct E18_Previews: PreviewProvider {
  static var previews: some View {
    E18()
  }
}
