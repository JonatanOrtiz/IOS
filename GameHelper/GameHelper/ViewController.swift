//
//  ViewController.swift
//  GameHelper
//
//  Created by Jonatan Eduardo de Araujo on 05/03/21.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var character0: UIButton!
  @IBOutlet weak var character1: UIButton!
  @IBOutlet weak var character2: UIButton!
  
  
//  @IBAction func unwindToMainMenu(sender: UIStoryboardSegue) {
//    let source = sender.sourceV
//  }
//
  
  var character = 0
  static var characters = [JSONModelElement]()
  
  @IBSegueAction func characterDetailsSegueAction(_ coder: NSCoder) -> CharacterDetails? {
    return CharacterDetails(coder: coder, character: character)
  }
  
  
  @IBAction func characterButtonTapped(_ sender: UIButton) {
    character = sender.tag
    performSegue(withIdentifier: "characterDetailsSegue", sender: nil)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateData()
  }
  
  func updateData() {
    if let url = Bundle.main.url(forResource: "Dados", withExtension: "json") {
      
      guard let jsonData = try? Data(contentsOf: url) else { return }
      ViewController.characters = try! JSONDecoder().decode([JSONModelElement].self, from: jsonData)
    }
    let arrChar = [character0, character1, character2]
    for i in 0...2 {
      arrChar[i]!.setBackgroundImage(UIImage(named: ViewController.characters[i].image!), for: UIControl.State.normal)
    }
  }
}
