import SwiftUI

struct E09: View {
  @State private var val1 = "0"
  @State private var val2 = "0"
  
  var sum: Double {
    let op1 = Double(val1) ?? 0
    let op2 = Double(val2) ?? 0
    return op1 + op2
  }
  
    var body: some View {
      Form {
        Section(header: Text("Values")) {
          TextField("valor 1: ", text: $val1)
          TextField("valor 2: ", text: $val2)
        }
        Section(header: Text("Result")) {
          Text("\(sum)")
        }
      }
    }
}

struct E09_Previews: PreviewProvider {
    static var previews: some View {
        E09()
    }
}
