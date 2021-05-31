//
//  Exercicio04.swift
//  SwiftBol
//
//  Created by Jonatan Eduardo de Araujo on 12/02/21.
//

import SwiftUI

struct Exercicio04: View {
  @State private var name: String = "Jonatan"
  @State private var phoneNumber: String = "44 991637767"
  @State private var city: String = "Curitiba"
  @State private var age: Int = 33
  @State private var height: Double = 1.65
  @State private var weight: Double = 65.56
  
    var body: some View {
      List {
        Text(name)
        Text(phoneNumber)
        Text(city)
        Text("\(age)")
        Text("\(height, specifier: "%.2f")")
        Text("\(weight, specifier: "%.2f")")
      }
    }
}

struct Exercicio04_Previews: PreviewProvider {
    static var previews: some View {
        Exercicio04()
    }
}
