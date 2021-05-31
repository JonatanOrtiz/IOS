import SwiftUI
import Combine

struct E88: View {
  @State private var nonAcceptedInputs = " -.0123456789/!|[]{}˜ˆ`;:'@#$%&*()_+="
  @State private var names = ""
  @State private var name = ""
  @State private var text = ""
  
  func verification() {
    text = ""
    let array = names.split(separator: ",")
    array.contains(where: {$0.lowercased() == name.lowercased()}) ? (text = "ACHEI") : (text = "NÃO ACHEI")
  }
  
  var body: some View {
    Form {
      Section(header: Text("Nomes")) {
        TextField("Separar nomes por vírgulas", text: $names)
          .disableAutocorrection(true)
          .autocapitalization(.none)
          .onReceive(Just(names)) { newValue in
            let filtered = newValue.filter { !nonAcceptedInputs.contains($0) }
            if filtered != newValue {
              self.names = filtered
            }
          }
      }
      Section(header: Text("Nome")) {
        TextField("Digite o nome a ser buscado", text: $name)
          .disableAutocorrection(true)
          .autocapitalization(.none)
          .onReceive(Just(name)) { newValue in
            let filtered = newValue.filter { !nonAcceptedInputs.contains($0) }
            if filtered != newValue {
              self.name = filtered
            }
          }
      }
      Button(action: verification, label: {
        Text("Verificar")
      })
      Section(header: Text("Resultado")) {
        Text("\(text)")
      }
    }
  }
}

struct E88_Previews: PreviewProvider {
  static var previews: some View {
    E88()
  }
}
