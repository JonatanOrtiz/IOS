//
//  LoginViewModel.swift
//  LoginExemploMVVM
//
//  Created by Curitiba on 23/04/21.
//

import Foundation

class LoginViewModel {
  
  func login(_ txtUsername: String, _ txtPassword: String) -> String {
    
    guard txtUsername == "bolinho" && txtPassword == "123" else {
      print("ok")
      return "Login incorreto"
    }
    print("nok")
    return "Login correto!"
    
  }
}
