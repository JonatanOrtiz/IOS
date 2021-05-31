//
//  SharedLabel.swift
//  AboutMeViewCode
//
//  Created by Jonatan Eduardo de Araujo on 24/03/21.
//

import UIKit

class SharedLabel: UILabel {
  
  override var text: String? {
    didSet {
      guard let words = text?.components(separatedBy: ", ")
      else { return }
      let joinedWords = words.joined(separator: "\n")
      guard text != joinedWords else { return }
      DispatchQueue.main.async { [weak self] in
        self?.text = joinedWords
      }
    }
  }
  
  func setConstraints(view: UIView) {
    
    self.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
  init(fullName: String? = "Label Text" ) {
    super.init(frame: .zero)
    setTextAttributes()
    text = fullName
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func setTextAttributes() {
    numberOfLines = 0
    textAlignment = .center
    textColor = .yellow
    font = UIFont.boldSystemFont(ofSize: 40)
  }
  
}
