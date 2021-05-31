import SwiftUI
import Combine

struct E19: View {
  @State private var acceptedInputs = ".0123456789"
  @State private var salary = ""
  @State private var readjustment = ""
  @State private var newSalary = ""
  
  func percentageCalc() {
    let sD = Double(salary) ?? 0
    let rD = Double(readjustment) ?? 0
    newSalary = String(round(100 * (sD * (rD/100 + 1)))/100)
  }
  
  var body: some View {
    Form {
      Section(header: Text("Valores")) {
        TextField("Salário", text: $salary)
          .onReceive(Just(salary)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.salary = filtered
            }
          }
        TextField("Reajuste", text: $readjustment)
          .onReceive(Just(readjustment)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.readjustment = filtered
            }
          }
      }
      Button(action: percentageCalc, label: {
        Text("Calcular")
      })
      Section(header: Text("Novo Salário")) {
        Text("\(newSalary)")
      }
    }
  }
}

struct E19_Previews: PreviewProvider {
  static var previews: some View {
    E19()
  }
}
