//
//  BottomSheetBackgroundView.swift
//
//  Created by jonatan on 16/12/21.
//

import SwiftUI

struct BottomSheet<BottomSheetContent: View>: View {
  @State var offset: CGFloat = 0
  @State var lastOffset: CGFloat = 0
  @State var maxOffSetAllowed: CGFloat = 1000
  @GestureState var gestureOffset: CGFloat = 0
  @ViewBuilder var bottomSheetContent: BottomSheetContent
  @Binding var showBottomSheet: Bool
  
  let bottomSheetMinHeight: CGFloat = 200
  let opacityLimit: CGFloat = 0.7
  
  var movable: Bool
  
  var opacityFactor: CGFloat {
    -offset / (UIScreen.main.bounds.height) + 0.2
  }
  
  var opacity: CGFloat {
    if movable {
      return opacityFactor > 0.3 ? opacityFactor < opacityLimit ? opacityFactor : opacityLimit : 0.3
    } else {
      return 0.3
    }
  }
  
  func BottomSheetView() -> AnyView {
    return AnyView(
      ZStack{
        BlurView(style: .light)
          .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 30))
        bottomSheetContent
          .padding(.horizontal)
          .frame(maxHeight: .infinity, alignment: .top)
      }
        .offset(y: maxOffSetAllowed)
        .offset(y: configureOffSet(maxOffSetAllowed: maxOffSetAllowed))
        .gesture(DragGesture().updating($gestureOffset, body: { value, out, _ in
          out = value.translation.height
          onChange()
        }).onEnded({ value in
          withAnimation{
            if -offset > maxOffSetAllowed / 2 {
              offset = -maxOffSetAllowed
            } else if -offset > 0 {
              offset = 0
            }
            else {
              showBottomSheet = false
            }
          }
          lastOffset = offset
        }))
    )
  }
  
  var body: some View {
    ZStack{
      ZStack {
        Color.black.ignoresSafeArea()
      }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .opacity(opacity)
      GeometryReader { proxy -> AnyView in
        
        let screenHeight = proxy.frame(in: .global).height
        
        DispatchQueue.main.async {
          maxOffSetAllowed = screenHeight - bottomSheetMinHeight
        }
        
        return BottomSheetView()
      }
      .ignoresSafeArea(.all, edges: .bottom)
    }
  }
  
  func configureOffSet(maxOffSetAllowed: CGFloat) -> CGFloat {
    if movable {
      return -offset > 0 ? -offset <= maxOffSetAllowed ? offset : -maxOffSetAllowed : offset
    } else {
      return -offset > 0 ? 0 : offset
    }
  }
  
  func onChange(){
    DispatchQueue.main.async {
      self.offset = gestureOffset + lastOffset
    }
  }
  
}
