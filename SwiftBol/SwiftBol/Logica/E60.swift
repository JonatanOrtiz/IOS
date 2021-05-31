import SwiftUI

struct E60: View {
  @State private var showingSheet = false
  @State private var userId = ""
  @State private var password = ""
  @State private var informatinText = ""
  @State private var showPasswordField = false
  
  let user = "1234"
  let pass = "9999"
  
  func checkLogin() {
    if userId == user {
      informatinText = ""
      showPasswordField = true
      if password == pass {
        informatinText = "Logado!"
      } else if password != "" {
        informatinText = "Senha incorreta"
      }
    } else {
      informatinText = "ID incorreto"
      showPasswordField = false
    }
  }
  
  var body: some View {
    ZStack {
      Color.init(red: 0.2, green: 0.1, blue: 0.8, opacity: 0.2)
        .edgesIgnoringSafeArea(.all)
      VStack {
        Section(header: Text("Login").padding()) {
          TextField("Digite seu ID", text: $userId)
            .padding()
            .frame(height: 50)
            .background(Color.white)
            .cornerRadius(16)
        }
        if showPasswordField {
          Section(header: Text("Password").padding()) {
            SecureField("Digite sua senha", text: $password)
              .padding()
              .frame(height: 50)
              .background(Color.white)
              .cornerRadius(16)
          }
        }
        Text("\(informatinText)").foregroundColor(informatinText == "Logado!" ? .green : .red).padding()
        if informatinText != "Logado!" {
          Button(action: checkLogin, label: {
            Text("\(showPasswordField ? "Logar" : "Verificar ID")")
          }).padding()
        }
      }
      .frame(width: UIScreen.main.bounds.size.width - 40, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
  }
}

struct E60_Previews: PreviewProvider {
  static var previews: some View {
    E60()
  }
}
