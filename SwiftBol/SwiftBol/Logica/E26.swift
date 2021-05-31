import SwiftUI
import Combine

struct E26: View {
  @State private var acceptedInputs = "0123456789"
  @State private var month = ""
  @State private var day = ""
  
  var daysCount: String {
    let monthInt = Int(month) ?? 0
    let dayInt = Int(day) ?? 0
    let dcount = ((monthInt - 1) * 30) + dayInt
    if dcount < 1 {
      return ""
    } else {
      return String(dcount)
    }
  }
  
  var body: some View {
    Form {
      Section(header: Text("Informe a sua idade")) {
        TextField("Mês atual", text: $month)
          .onReceive(Just(month)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.month = filtered
            }
          }
        TextField("Dia  atual", text: $day)
          .onReceive(Just(day)) { newValue in
            let filtered = newValue.filter { acceptedInputs.contains($0) }
            if filtered != newValue {
              self.day = filtered
            }
          }
      }
      Section(header: Text("Total de dias")) {
        Text("\(daysCount)")
      }
    }
  }
}

struct E26_Previews: PreviewProvider {
  static var previews: some View {
    E26()
  }
}
