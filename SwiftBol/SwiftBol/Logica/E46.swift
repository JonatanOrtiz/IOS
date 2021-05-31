import SwiftUI
import Combine

struct E46: View {
  @State private var acceptedInputs = "-.0123456789"
  @State private var accountNumber = ""
  @State private var balace = ""
  @State private var debit = ""
  @State private var credit = ""
  @State private var currentBalance = 0.0
  
  func percentageCalc() {
    let bD = Double(balace) ?? 0
    let cD = Double(credit) ?? 0
    let dD = Double(debit) ?? 0
    currentBalance = round(100 * (bD - dD + cD))/100
  }
  
  var body: some View {
    Form {
      Section(header: Text("Dados da conta")) {
        TextField("Número da conta", text: $accountNumber)
          .onReceive(Just(accountNumber)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.accountNumber = filtered
            }
          }
        TextField("Saldo", text: $balace)
          .onReceive(Just(balace)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.balace = filtered
            }
          }
        TextField("Crédito", text: $credit)
          .onReceive(Just(credit)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.credit = filtered
            }
          }
        TextField("Débito", text: $debit)
          .onReceive(Just(debit)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.debit = filtered
            }
          }
      }
      Button(action: percentageCalc, label: {
        Text("Calcular")
      })
      Section(header: Text("Saldo")) {
        Text("\(currentBalance, specifier: "%.2f")")
        Text("\(currentBalance == 0 ? "Saldo Zero" : currentBalance < 0 ?  "Saldo Negativo" : "Saldo Positivo")")
      }
    }
  }
}

struct E46_Previews: PreviewProvider {
  static var previews: some View {
    E46()
  }
}
