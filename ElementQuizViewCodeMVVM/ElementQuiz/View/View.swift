//
//  View.swift
//  ElementQuiz
//
//  Created by Jonatan Eduardo de Araujo on 31/03/21.
//

import UIKit

class View {
  
  // MARK: - Properties
  let imageView: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFill
    return image
  }()
  
  let answerLabel: UILabel = {
    let label = UILabel()
    label.text = "Answer Label"
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    return label
  }()
  
  let modeSelector = UISegmentedControl()
  
  let textField: UITextField = {
    let textAnswer = UITextField()
    textAnswer.placeholder = "Enter text here"
    textAnswer.font = UIFont.systemFont(ofSize: 15)
    textAnswer.borderStyle = UITextField.BorderStyle.roundedRect
    textAnswer.autocorrectionType = UITextAutocorrectionType.no
    textAnswer.keyboardType = UIKeyboardType.default
    textAnswer.returnKeyType = UIReturnKeyType.done
    textAnswer.clearButtonMode = UITextField.ViewMode.whileEditing
    textAnswer.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    return textAnswer
  }()
  
  let showAnswerButton = UIButton.createSystemButton(withTitle: "Show Answer")
  let nextButton = UIButton.createSystemButton(withTitle: "Next")
  
  lazy var buttonsStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [showAnswerButton, nextButton])
    stackView.spacing = 50
    return stackView
  }()
  
  lazy var masterStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [modeSelector, imageView, answerLabel, textField, buttonsStackView])
    stackView.distribution = .fill
    stackView.axis = .vertical
    stackView.spacing = 32
    stackView.alignment = .center
    return stackView
  }()

}

// MARK: -
private extension UIButton {
  
  static func createSystemButton(withTitle title: String) -> UIButton {
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    return button
  }
}

