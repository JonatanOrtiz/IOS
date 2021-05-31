//
//  HobbiesViewController.swift
//  AboutMeViewCode
//
//  Created by Jonatan Eduardo de Araujo on 23/03/21.
//

import UIKit

class HobbiesViewController: UIViewController {
  
  let shareView = ShareImageView(frame: UIScreen.main.bounds)
  let sharedLabel = SharedLabel(fullName: "Hobbies, ashdas, hasuifdh")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(shareView)
    view.addSubview(sharedLabel)
    sharedLabel.setConstraints(view: view)
  }
  
}
