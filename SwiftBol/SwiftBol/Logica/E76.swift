import SwiftUI
import Combine

struct E76: View {
  @State private var acceptedInputs = ",.-0123456789"
  @State private var numbers = ""
  
  var calc: Double {
    let numbersArray = numbers.split(separator: ",")
    let numbersArrayDouble = numbersArray.compactMap { x in Double(x) }
    let total = numbersArrayDouble.reduce(0, +)
    return total
  }
  
  var body: some View {
    Form {
      Section(header: Text("Valores")) {
        TextField("Números separados por vírgula", text: $numbers)
          .onReceive(Just(numbers)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.numbers = filtered
            }
          }
      }
      Section(header: Text("Soma")) {
        Text("\(calc, specifier: "%.2f")")
      }
    }
  }
}

struct E76_Previews: PreviewProvider {
  static var previews: some View {
    E76()
  }
}
