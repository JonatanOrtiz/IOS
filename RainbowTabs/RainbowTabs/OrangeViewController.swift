//
//  OrangeViewController.swift
//  RainbowTabs
//
//  Created by Jonatan Eduardo de Araujo on 03/03/21.
//

import UIKit

class OrangeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  override func viewDidAppear(_ animated: Bool) {
    tabBarItem.badgeValue = "O"
  }
  override func viewWillDisappear(_ animated: Bool) {
    tabBarItem.badgeValue = nil
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
