import SwiftUI

struct Ex06: View {
  @State private var name = String()
  @State private var phone = String()
  @State private var city = String()
  @State private var age = String()
  @State private var height = String()
  @State private var weight = String()
  
    var body: some View {
      Form {
        Section(header: Text("User Information")) {
          TextField("Nome: ", text: $name)
          TextField("Celular: ", text: $phone)
          TextField("Cidade: ", text: $city)
          TextField("Idade: ", text: $age)
          TextField("Altura: ", text: $height)
          TextField("Peso: ", text: $weight)
        }
        Section(header: Text("Data")) {
          Text("\(name)")
          Text("\(phone)")
          Text("\(city)")
          Text("\(age)")
          Text("\(height)")
          Text("\(weight)")
        }
      }
    }
}

struct Ex06_Previews: PreviewProvider {
    static var previews: some View {
        Ex06()
    }
}
