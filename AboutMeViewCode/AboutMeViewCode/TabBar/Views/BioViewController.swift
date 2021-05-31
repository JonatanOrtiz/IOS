//
//  BioViewController.swift
//  AboutMeViewCode
//
//  Created by Jonatan Eduardo de Araujo on 23/03/21.
//

import UIKit

class BioViewController: UIViewController {
  
  let shareView = ShareImageView(frame: UIScreen.main.bounds)
  let sharedLabel = SharedLabel(fullName: "BIO, ashdas, hasuifdh")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(shareView)
    view.addSubview(sharedLabel)
    sharedLabel.setConstraints(view: view)
  }
  
}
