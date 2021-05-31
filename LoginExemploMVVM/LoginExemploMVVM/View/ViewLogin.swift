//
//  ViewLogin.swift
//  LoginExemploMVVM
//
//  Created by Curitiba on 23/04/21.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class ViewLogin: UIView {
  
  var disposedBag = DisposeBag()
  
  @IBOutlet weak var textFieldUser: UITextField!
  @IBOutlet weak var textFieldPassword: UITextField!
  @IBOutlet weak var statusLoginLabel: UILabel!
  @IBOutlet weak var loginButton: UIButton!
  

  func setup(viewModel: LoginViewModel) {
    
    print("setup")
    
    loginButton.rx.tap.bind {
      guard let txtLogin = self.textFieldUser.text,
            let txtPassword = self.textFieldPassword.text else {
        return
        
      }
      
      self.statusLoginLabel.text = viewModel.login(txtLogin, txtPassword)
      
    } .disposed(by: disposedBag)
  }
  
}
