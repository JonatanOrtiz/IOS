import SwiftUI

public let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))

public struct StylizedLabelTest: View {
  var labelText: String

  public var body: some View {
    Text(labelText)
      .padding()
      .foregroundColor(.white)
      .background(Color.red)
      .clipShape(Capsule())
  }
}
