import SwiftUI

struct E24: View {
  @State private var n1 = "0"
  @State private var n2 = "0"
  @State private var n3 = "0"
  @State private var media = "0"
  
  func mediaCalc() {
    let op1 = Double(n1) ?? 0
    let op2 = Double(n2) ?? 0
    let op3 = Double(n3) ?? 0
    media = String((op1 * 2 + op2 * 3 + op3 * 5)/10)
    print("console")
  }

    var body: some View {
      Form {
        Section(header: Text("Notas")) {
          TextField("Nota 1: ", text: $n1)
          TextField("Nota 2: ", text: $n2)
          TextField("Nota 3: ", text: $n3)
        }
        Button(action: self.mediaCalc, label: {
          Text("Calcular")
        })
        Section(header: Text("Media")) {
          Text("\(media)")
        }
      }
    }
}

struct E24_Previews: PreviewProvider {
    static var previews: some View {
        E24()
    }
}
