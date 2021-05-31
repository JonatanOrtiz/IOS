import SwiftUI
import Combine

struct E30: View {
  @State private var acceptedInputs = "-0123456789"
  @State private var celsius = ""
  
  var fahrenheit: String {
    let celsiusD = Double(celsius) ?? 0
    return String((celsiusD * 9.0/5.0) + 32.0)
  }

    var body: some View {
      Form {
        Section(header: Text("Celcius")) {
          TextField("valor", text: $celsius)
            .onReceive(Just(celsius)) { newValue in
              let filtered = newValue.filter { acceptedInputs.contains($0) }
              if filtered != newValue {
                self.celsius = filtered
              }
            }
        }
        Section(header: Text("Fahrenheit")) {
          Text("\(celsius == "" ? "" : fahrenheit)")
        }
      }
    }
}

struct E30_Previews: PreviewProvider {
    static var previews: some View {
        E30()
    }
}
