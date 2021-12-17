//
//  BottomSheetContent.swift
//  BottomSheet
//
//  Created by jonatan on 16/12/21.
//

import SwiftUI

struct MainView: View {
  @State var showBottomSheet: Bool = false
  
  var body: some View {
    GeometryReader { proxy in
      let frame = proxy.frame(in: .global)
      Image("bg")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: frame.width, height: frame.height)
      VStack(spacing: 8){
        Button(action: { showBottomSheet.toggle() }, label: {
          Image(systemName: "list.bullet.rectangle.fill")
            .font(.title)
            .frame(width: 100, height: 100)
            .background(BlurView(style: .extraLight))
        })
        Text("Ver Opções")
          .foregroundColor(.white)
          .bold()
      }
      if showBottomSheet {
        BottomSheet(bottomSheetContent: {
          SomeViewForBottomSheetContent()
        }, showBottomSheet: $showBottomSheet, movable: true)
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
