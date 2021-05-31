//
//  ViewController.swift
//  LoginExemploMVVM
//
//  Created by Curitiba on 23/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  let loginView = ViewLogin()
  let loginViewModel = LoginViewModel()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("ViewController AL:JBCOASBCOBSOCBABSCBASBCUBAS:CBASUCBAS:CBA:USCB:IUASBC:AUSBCIAUSBCUYVCUVCEUWYVC")
    
    loginView.setup(viewModel: loginViewModel)
  }
  
  
}

