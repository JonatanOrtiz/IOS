//
//  ViewController.swift
//  RainbowTabs
//
//  Created by Jonatan Eduardo de Araujo on 02/03/21.
//

import UIKit

class RedViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  override func viewDidAppear(_ animated: Bool) {
    tabBarItem.badgeValue = "R"
  }
  override func viewWillDisappear(_ animated: Bool) {
    tabBarItem.badgeValue = nil
  }
}

