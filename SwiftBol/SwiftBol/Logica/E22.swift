import SwiftUI
import Combine

struct E22: View {
  @State private var acceptedInputs = ".0123456789"
  @State private var totalCars = ""
  @State private var totalSold = ""
  @State private var fixedCommission = ""
  @State private var baseSalary = ""
  @State private var salary = ""
  
  func percentageCalc() {
    let tcD = Double(totalCars) ?? 0
    let tsD = Double(totalSold) ?? 0
    let bsD = Double(baseSalary) ?? 0
    let fcD = Double(fixedCommission) ?? 0
    salary = String(round(100 * (bsD + (fcD * tcD) + (0.05 * tsD)))/100)
  }
  
  var body: some View {
    Form {
      Section(header: Text("Valores")) {
        TextField("Total de carros vendidos", text: $totalCars)
          .onReceive(Just(totalCars)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.totalCars = filtered
            }
          }
        TextField("Valor total de vendas", text: $totalSold)
          .onReceive(Just(totalSold)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.totalSold = filtered
            }
          }
        TextField("Salário base", text: $baseSalary)
          .onReceive(Just(baseSalary)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.baseSalary = filtered
            }
          }
        TextField("Comissão fixa por carro", text: $fixedCommission)
          .onReceive(Just(fixedCommission)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.fixedCommission = filtered
            }
          }
      }
      Button(action: percentageCalc, label: {
        Text("Calcular")
      })
      Section(header: Text("Novo Salário")) {
        Text("\(salary)")
      }
    }
  }
}

struct E22_Previews: PreviewProvider {
  static var previews: some View {
    E22()
  }
}
