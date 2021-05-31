//
//  ViewController.swift
//  testeUIKit
//
//  Created by Jonatan Eduardo de Araujo on 23/02/21.
//

import UIKit

class ViewController: UIViewController {
  
  fileprivate func clickOnMeButton() {
    let myButton = UIButton(type: .system)
    
    myButton.frame = CGRect(x: 120, y: 300, width: 200, height: 50)
    myButton.setTitle("Clique em mim", for: .normal)
    myButton.addTarget(self, action: #selector(myButtonAction(_:)), for: .touchUpInside)
    
    let myButton2 = UIButton(type: .system)
    
    myButton2.frame = CGRect(x: 120, y: 400, width: 200, height: 50)
    myButton2.setTitle("Clique em mim", for: .normal)
    myButton2.addTarget(self, action: #selector(myButtonAction2(_:)), for: .touchUpInside)
    
    view.addSubview(myButton)
    view.addSubview(myButton2)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    clickOnMeButton()
  }
  
  @objc func myButtonAction(_ sender: UIButton!) {
    print("Botão 1 clicado!")
  }
  @objc func myButtonAction2(_ sender: UIButton!) {
    print("Botão 2 clicado!")
  }
}

#if DEBUG
import SwiftUI

struct InfoVCRepresentable: UIViewControllerRepresentable {
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    // leave this empty
  }
  
  @available(iOS 13.0.0, *)
  func makeUIViewController(context: Context) -> UIViewController {
    ViewController()
  }
}

@available(iOS 13.0, *)
struct InfoVCPreview: PreviewProvider {
  static var previews: some View {
    InfoVCRepresentable()
  }
}
#endif
