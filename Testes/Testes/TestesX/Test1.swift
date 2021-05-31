import SwiftUI

struct Test1<Content: View>: View {
  var content: Content
  
  var body: some View {
    VStack {
//            self.view.addSubview(label1)
      content
      StylizedLabelTest(labelText: "JS")
      StylizedLabelTest(labelText: "Swift")
      StylizedLabelTest(labelText: "Typescript")
    }
  }
}

struct Test1_Previews: PreviewProvider {
  static var previews: some View {
    Test1(content: Text("Lenguages"))
  }
}
