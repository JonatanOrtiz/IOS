import SwiftUI
import Combine

struct E29: View {
  @State private var acceptedInputs = "0123456789"
  @State private var qtd = ""
  @State private var cheese = 0.0
  @State private var ham = 0.0
  @State private var hamburger = 0.0
  
  func calc() {
    let qtdD = Double(qtd) ?? 0
    cheese = qtdD * 50/1000
    ham = qtdD * 50/1000
    hamburger = qtdD * 100/1000
  }
  
  var body: some View {
    Form {
      Section(header: Text("Lanches")) {
        TextField("Quantidade", text: $qtd)
          .onReceive(Just(qtd)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.qtd = filtered
            }
          }
      }
      Button(action: calc, label: {
        Text("Calcular")
      })
      Section(header: Text("qtd de dias")) {
        Text("Qeuijo: \(cheese, specifier: "%.2f") Kg")
        Text("Presunto: \(ham, specifier: "%.2f") Kg")
        Text("Hamburger: \(hamburger, specifier: "%.2f") Kg")
      }
    }
  }
}

struct E29_Previews: PreviewProvider {
  static var previews: some View {
    E29()
  }
}
