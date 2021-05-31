import SwiftUI
import Combine

struct E45: View {
  @State private var acceptedInputs = ".0123456789"
  @State private var baseSalary = ""
  @State private var totalSold = ""
  @State private var salary = ""
  
  func calc() {
    let bsD = Double(baseSalary) ?? 0
    let tsD = Double(totalSold) ?? 0
    if tsD <= 1500 {
      salary = String(round(100 * (bsD + tsD * 0.03))/100)
    } else {
      salary = String(round(100 * (bsD + tsD * 0.05 - (1500 * 0.02)))/100)
    }
  }

  var body: some View {
    Form {
      Section(header: Text("Valores")) {
        TextField("Salário base", text: $baseSalary)
          .onReceive(Just(baseSalary)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.baseSalary = filtered
            }
          }
        TextField("Valor total de vendas", text: $totalSold)
          .onReceive(Just(totalSold)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.totalSold = filtered
            }
          }
      }
      Button(action: calc, label: {
        Text("Calcular")
      })
      Section(header: Text("Novo Salário")) {
        Text("\(salary)")
      }
    }
  }
}

struct E45_Previews: PreviewProvider {
  static var previews: some View {
    E45()
  }
}
