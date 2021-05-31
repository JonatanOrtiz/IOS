import SwiftUI

struct E23: View {
  @State private var celscius = "0"
  @State private var fahrenheit = "0"
  @State private var result = "0"
  
  func fahrenheitToCelcius() {
    let doubleCelscius = Double(celscius) ?? 0
    result = String((doubleCelscius - 32) * 5/9)
  }

    var body: some View {
      Form {
        Section(header: Text("Fahrenheit")) {
          TextField("valor 1: ", text: $celscius)
        }
        Button(action: self.fahrenheitToCelcius, label: {
          Text("Convert")
        })
        Section(header: Text("Celcius")) {
          Text("\(result)")
        }
      }
    }
}

struct E23_Previews: PreviewProvider {
    static var previews: some View {
        E23()
    }
}
