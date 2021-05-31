//
//  MenuItemDetailViewController.swift
//  OrderApp
//
//  Created by Jonatan Eduardo de Araujo on 22/03/21.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var detailTextLabel: UILabel!
  @IBOutlet weak var addToOrderButton: UIButton!
  
  @IBAction func addToOrderButtonTapped(_ sender: UIButton) {
    UIView.animate(withDuration: 1.5, delay: 0,
                   usingSpringWithDamping: 0.05, initialSpringVelocity: 3,
                   options: [], animations: {
                    self.addToOrderButton.transform =
                      CGAffineTransform(scaleX: 2.0, y: 2.0)
                    self.addToOrderButton.transform =
                      CGAffineTransform(scaleX: 3.0, y: 3.0)
                    self.addToOrderButton.transform =
                      CGAffineTransform(scaleX: 2.0, y: 2.0)
                    self.addToOrderButton.transform =
                      CGAffineTransform(scaleX: 1.0, y: 1.0)
                    self.addToOrderButton.transform =
                      CGAffineTransform(scaleX: 2.0, y: 2.0)
                    self.addToOrderButton.transform =
                      CGAffineTransform(scaleX: 3.0, y: 3.0)
                    self.addToOrderButton.transform =
                      CGAffineTransform(scaleX: 2.0, y: 2.0)
                    self.addToOrderButton.transform =
                      CGAffineTransform(scaleX: 1.0, y: 1.0)
                   }, completion: nil)
    
    MenuController.shared.order.menuItems.append(menuItem)
  }
  
  
  let menuItem: MenuItem
  
  init?(coder: NSCoder, menuItem: MenuItem) {
    self.menuItem = menuItem
    super.init(coder: coder)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  func updateUI() {
    nameLabel.text = menuItem.name
    priceLabel.text = MenuItem.priceFormatter.string(from: NSNumber(value: menuItem.price))
    detailTextLabel.text = menuItem.detailText
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
