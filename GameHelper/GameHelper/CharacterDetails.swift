//
//  characterDetails.swift
//  GameHelper
//
//  Created by Jonatan Eduardo de Araujo on 08/03/21.
//
import UIKit

class CharacterDetails: UIViewController {
  
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var profileImage: UIImageView!
  
  @IBOutlet var moves: [UIStackView]!
  
  @IBOutlet weak var punch1: UIImageView!
  @IBOutlet weak var punch2: UIImageView!
  @IBOutlet weak var punch3: UIImageView!
  @IBOutlet weak var kick1: UIImageView!
  @IBOutlet weak var kick2: UIImageView!
  @IBOutlet weak var kick3: UIImageView!
  @IBOutlet weak var specialMove1: UIImageView!
  @IBOutlet weak var specialMove2: UIImageView!
  @IBOutlet weak var specialMove3: UIImageView!
  @IBOutlet weak var specialMove4: UIImageView!
  @IBOutlet weak var super1: UIImageView!
  @IBOutlet weak var super2: UIImageView!
  @IBOutlet weak var super3: UIImageView!
  @IBOutlet weak var super4: UIImageView!
  
  func test() {
    let url = URL(string: "https://swapi.co/api/films/1/")!
    let task = URLSession.shared.dataTask(with: url) {
      (data, response, error) in
      guard let data = data,
            let content = String(data: data,
                                 encoding: String.Encoding.utf8) else { return }
      self.name.text = content
    }
    task.resume()
  }
  
  func saveImage(image: UIImage) -> Bool {
    guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
          return false
      }
      guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
          return false
      }
      do {
          try data.write(to: directory.appendingPathComponent("fileName.png")!)
          return true
      } catch {
          print(error.localizedDescription)
          return false
      }
  }
  
  
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
  
  @IBOutlet weak var movesStackView: UIStackView!
  @IBOutlet weak var informationsStackView: UIStackView!
  @IBOutlet weak var combosStackView: UIStackView!
  @IBOutlet weak var movesDescriptionStackView: UIStackView!
  
  @IBAction func backButtonMovesDescription() {
    movesStackView.isHidden = false
    informationsStackView.isHidden = true
    combosStackView.isHidden = true
    movesDescriptionStackView.isHidden = true
  }
  
  @IBAction func switchSegment(_ sender: Any) {
    if segmentedControl.selectedSegmentIndex == 0 {
      movesStackView.isHidden = false
      informationsStackView.isHidden = true
      combosStackView.isHidden = true
      movesDescriptionStackView.isHidden = true
    } else if segmentedControl.selectedSegmentIndex == 1 {
      informationsStackView.isHidden = false
      movesStackView.isHidden = true
      combosStackView.isHidden = true
      movesDescriptionStackView.isHidden = true
    } else {
      combosStackView.isHidden = false
      movesStackView.isHidden = true
      informationsStackView.isHidden = true
      movesDescriptionStackView.isHidden = true
    }
  }
  
  var character: Int
  
  @objc func stackViewTapped(gesture : UITapGestureRecognizer) {
    //    print(gesture.view!.tag)
    movesStackView.isHidden = true
    movesDescriptionStackView.isHidden = false
  }
  
  init?(coder: NSCoder, character: Int) {
    self.character = character
    super.init(coder: coder)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    test()
    informationsStackView.isHidden = true
    combosStackView.isHidden = true
    movesDescriptionStackView.isHidden = true
    
    for stack in moves {
      stack.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(stackViewTapped)))
    }
    
    updateCharacter()
  }
  
  func updateCharacter() {
    let chars = ViewController.characters
    name.text = chars[character].fullName
    profileImage.image = UIImage(named: chars[character].image!)
    punch1.image = UIImage(named: chars[character].soco_01!)
    punch2.image = UIImage(named: chars[character].soco_02!)
    punch3.image = UIImage(named: chars[character].soco_03!)
    kick1.image = UIImage(named: chars[character].chute_01!)
    kick2.image = UIImage(named: chars[character].chute_02!)
    kick3.image = UIImage(named: chars[character].chute_03!)
  }
  
}
