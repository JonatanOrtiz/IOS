import SwiftUI
import Combine

struct E98: View {
  @State private var acceptedInputs = ",0123456789"
  @State private var v1 = ""
  @State private var v2 = ""
  @State private var total = 0
  @State private var values: [String] = []
  @State private var positions: [String] = []
  
  func verification() {
    total = 0
    values = []
    positions = []
    let v1Array = v1.split(separator: ",")
    let v2Array = v2.split(separator: ",")
    for x in 0...v1Array.count - 1 {
      for y in 0...v2Array.count - 1 {
        if v1Array[x] == v2Array[y] && x == y {
          values.append(String(v1Array[x]))
          positions.append(String(x + 1))
          total = total + 1
        }
      }
    }
  }
  
  var body: some View {
    Form {
      Section(header: Text("Vetores")) {
        TextField("Vetor 1 (separar números por vírgulas)", text: $v1)
          .onReceive(Just(v1)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.v1 = filtered
            }
          }
        TextField("Vetor 2 (separar números por vírgulas)", text: $v2)
          .onReceive(Just(v2)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.v2 = filtered
            }
          }
      }
      Button(action: verification, label: {
        Text("Verificar")
      })
      Section(header: Text("Total de repetições")) {
        Text("\(total) repetições")
        Text("Dos valores: \(values.joined(separator: ", "))")
        Text("Nas posições: \(positions.joined(separator: ", "))")
      }
    }
  }
}

struct E98_Previews: PreviewProvider {
  static var previews: some View {
    E98()
  }
}
