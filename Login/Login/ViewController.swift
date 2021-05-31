//
//  ViewController.swift
//  Login
//
//  Created by Jonatan Eduardo de Araujo on 02/03/21.
//

import UIKit


class ViewController: UIViewController {
  
  let user = "jow"
  let pass = "123"
  
  @IBOutlet weak var forgotUsernameButton: UIButton!
  @IBOutlet weak var forgotPasswordButton: UIButton!
  @IBOutlet weak var userName: UITextField!
  @IBOutlet weak var password: UITextField!
  
  @IBAction func ForgotUserNameAction(_ sender: UIButton) {
    performSegue(withIdentifier: "principalSegue", sender: sender)
  }
  @IBAction func forgotPasswordAction(_ sender: UIButton) {
    performSegue(withIdentifier: "principalSegue", sender: sender)
  }
  @IBAction func login(_ sender: UIButton) {
    guard let userName = userName.text, let password = password.text,
          !userName.isEmpty, !password.isEmpty,
          userName == user, password == pass else { return }
    performSegue(withIdentifier: "principalSegue", sender: sender)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let sender = sender as? UIButton else {return}
    
    if sender == forgotPasswordButton {
      segue.destination.navigationItem.title = "Forgot Password"
    } else if sender == forgotUsernameButton {
      segue.destination.navigationItem.title = "Forgot Username"
    } else {
      segue.destination.navigationItem.title = userName.text
    }
  }
  
}

