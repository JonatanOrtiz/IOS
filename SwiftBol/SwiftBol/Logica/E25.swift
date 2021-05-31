import SwiftUI
import Combine

struct E25: View {
  @State private var acceptedInputs = ".0123456789"
  @State private var paid = ""
  @State private var price = ""
  @State private var liters = ""
  
  func percentageCalc() {
    let paidD = Double(paid) ?? 0
    let priceD = Double(price) ?? 0
    liters = String(round(100 * (paidD/priceD))/100)
  }
  
  var body: some View {
    Form {
      Section(header: Text("Valores")) {
        TextField("Total pago", text: $paid)
          .onReceive(Just(paid)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.paid = filtered
            }
          }
        TextField("Preço da gasolina", text: $price)
          .onReceive(Just(price)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.price = filtered
            }
          }
      }
      Button(action: percentageCalc, label: {
        Text("Calcular")
      })
      Section(header: Text("Litros")) {
        Text("\(liters)")
      }
    }
  }
}

struct E25_Previews: PreviewProvider {
  static var previews: some View {
    E25()
  }
}
