//
//  BottomSheetContent.swift
//  BottomSheet
//
//  Created by jonatan on 16/12/21.
//

import SwiftUI

struct SomeViewForBottomSheetContent: View {
  var body: some View{
    VStack{
      HStack{
        Text("Exemplo")
          .fontWeight(.bold)
          .foregroundColor(.white)
      }
      .padding(.top,20)
      
      Divider()
        .background(Color.white)
      
      ScrollView(.horizontal, showsIndicators: false, content: {
        HStack(spacing: 15){
          VStack(spacing: 8){
            Button(action: {}, label: {
              Image(systemName: "arrowshape.turn.up.right.fill")
                .font(.title)
                .frame(width: 65, height: 65)
                .background(BlurView(style: .light))
                .clipShape(Circle())
            })
            Text("Enviar")
              .foregroundColor(.white)
          }
          VStack(spacing: 8){
            Button(action: {}, label: {
              Image(systemName: "arrow.down.doc.fill")
                .font(.title)
                .frame(width: 65, height: 65)
                .background(BlurView(style: .light))
                .clipShape(Circle())
            })
            Text("Salvar")
              .foregroundColor(.white)
          }
          
          VStack(spacing: 8){
            Button(action: {}, label: {
              Image(systemName: "trash.fill")
                .font(.title)
                .frame(width: 65, height: 65)
                .background(BlurView(style: .light))
                .clipShape(Circle())
            })
            Text("Excluir")
              .foregroundColor(.white)
          }
          
        }
      })
        .padding(.top)
    }
  }
}
