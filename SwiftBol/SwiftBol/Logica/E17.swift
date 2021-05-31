import SwiftUI

struct E17: View {
  @State private var birthYear = "1987"
  @State private var birthMonth = "08"
  @State private var birthDay = "25"
  @State private var currentYear = Calendar.current.component(.year, from: Date())
  @State private var currentMonth = Calendar.current.component(.month, from: Date())
  @State private var currentDay = Calendar.current.component(.day, from: Date())
  @State private var totalDaysAge = 0
  
  func ageInDays() {
    let birthYearInt = Int(birthYear) ?? 0
    let birthMonthInt = Int(birthMonth) ?? 0
    let birthDayInt = Int(birthDay) ?? 0
    let currentTotalDays = ((currentYear - 1) * 365) + ((currentMonth - 1) * 30) + currentDay
    totalDaysAge = currentTotalDays - ((birthYearInt - 1) * 365) + ((birthMonthInt - 1) * 30) + birthDayInt
  }

    var body: some View {
      Form {
        Section(header: Text("Informe a sua idade")) {
          TextField("Ano de nascimento: ", text: $birthYear)
          TextField("Mês  de nascimento: ", text: $birthMonth)
          TextField("Dia de nascimento: ", text: $birthDay)
        }
        Button(action: self.ageInDays, label: {
          Text("Converter em dias")
        })
        Section(header: Text("Idade em dias")) {
          Text("\(totalDaysAge)")
        }
      }
    }
}

struct E17_Previews: PreviewProvider {
    static var previews: some View {
        E17()
    }
}
