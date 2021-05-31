import SwiftUI

struct WeatherButton: View {
  var title: String
  var textColor: Color
  var backgroudColor: Color
  
  var body: some View {
      Text("Change Day Time")
        .frame(width: 280, height: 50)
        .background(backgroudColor)
        .foregroundColor(textColor)
        .font(.system(size: 20, weight: .bold))
        .cornerRadius(10)
  }
}
