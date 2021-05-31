import SwiftUI

struct E10: View {
  @State private var val1 = "0"
  @State private var val2 = "0"
  @State private var result = "0"
  
  func numbersSum() {
    let op1 = Double(val1) ?? 0
    let op2 = Double(val2) ?? 0
    result = String(op1 + op2)
  }
  func numbersSubtraction() {
    let op1 = Double(val1) ?? 0
    let op2 = Double(val2) ?? 0
    result = String(op1 - op2)
  }
  func numbersMultiplication() {
    let op1 = Double(val1) ?? 0
    let op2 = Double(val2) ?? 0
    result = String(op1 * op2)
  }
  func numbersDivision() {
    let op1 = Double(val1) ?? 0
    let op2 = Double(val2) ?? 0
    result = String(op1 / op2)
  }
  
    var body: some View {
      Form {
        Section(header: Text("Values")) {
          TextField("valor 1: ", text: $val1)
          TextField("valor 2: ", text: $val2)
        }
        Button(action: self.numbersSum, label: {
          Text("Somar")
        })
        Button(action: self.numbersSubtraction, label: {
          Text("Subtrair")
        })
        Button(action: self.numbersMultiplication, label: {
          Text("Multiplicar")
        })
        Button(action: self.numbersDivision, label: {
          Text("Dividir")
        })
        Section(header: Text("Result")) {
          Text("\(result)")
        }
      }
    }
}

struct E10_Previews: PreviewProvider {
    static var previews: some View {
        E10()
    }
}
