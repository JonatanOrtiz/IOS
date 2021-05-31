//
//  ElementQuizViewModel.swift
//  ElementQuiz
//
//  Created by Curitiba on 25/03/21.
//

import Foundation
import UIKit.UIImage

public class ElementQuizViewModel {
  
  
  let gameMode = Box(0)
  let icon: Box<UIImage?> = Box(nil)  //no image initially
  
  var elementList = ["Carbon", "Gold", "Chlorine","Sodium"]
  let fixedElementList = ["Carbon", "Gold", "Chlorine","Sodium"]
  var currentElementIndex = 0
  var mode: Mode = .flashCard {
    didSet {
      switch mode {
      case .flashCard:
        setupFlashCards()
      case .quiz:
        setupQuiz()
      }
      updateUI()
    }
  }
  
  var state: State = .question
  var answerIsCorrect = false
  var correctAnswerCount = 0
  
  private lazy var biggerStack: UIStackView = {
    let stackView = UIStackView (arrangedSubviews: [modeSelector, imageView, textField, answerLabel, smallerStackView])
    stackView.distribution = .fill
    stackView.axis = .vertical
    stackView.spacing = 20
    stackView.alignment = .center
    
    return stackView
    
  }()
  
  private lazy var smallerStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews:
                                  [showAnswerButton, nextButton])
    stackView.distribution = .fillProportionally
    stackView.axis = .horizontal
    stackView.spacing = 30
    
    return stackView
  }()
  
  func setupStackView() {
    view.addSubview(biggerStack)
    biggerStack.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate ([
       biggerStack.widthAnchor.constraint(equalToConstant: 370),
       biggerStack.heightAnchor.constraint(equalToConstant: 430),
       biggerStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       biggerStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -160) //-130
      ])
  }
  
  
  
  @objc func switchModes(_ sender: Any) {
    if modeSelector.selectedSegmentIndex == 0 {
      mode = .flashCard
    } else {
      mode = .quiz
    }
  }
  
  @objc func showAnswer(_ sender:  UIButton) {
    state = .answer
    
    updateUI()
  }
  
  @objc func nextAnswer(_ sender:  UIButton) {
    currentElementIndex += 1
    if currentElementIndex >= elementList.count {
      currentElementIndex = 0
      if mode == .quiz {
        state = .score
        updateUI()
        return
      }
    }
    
    state = .question
    
    updateUI()
  }
  
  
  func updateFlashCardUI(elementName: String) {
    
    textField.isHidden = true
    textField.resignFirstResponder()
    
    if state == .answer {
      answerLabel.text = elementName
    } else {
      answerLabel.text = "?"
    }
    
    modeSelector.selectedSegmentIndex =
    
    showAnswerButton.isHidden = false
    nextButton.isEnabled = true
    nextButton.setTitle("Next Element", for: .normal)
  }
  
  
  func updateQuizUI(elementName: String) {
    
    modeSelector.selectedSegmentIndex = 1
    
    textField.isHidden = false
    switch state {
    case .question:
      textField.isEnabled = true
      textField.text = ""
      textField.becomeFirstResponder()
    case .answer:
      textField.isEnabled = false
      textField.resignFirstResponder()
    case .score:
      textField.isHidden = true
      textField.resignFirstResponder()
    }
    
    switch state {
    case .question:
      answerLabel.text = ""
    case .answer:
      if answerIsCorrect {
        answerLabel.text = "Correct!"
      } else {
        answerLabel.text = "❌ \nResposta correta: " + elementName
      }
    case .score:
      answerLabel.text = ""
      print("Your score is \(correctAnswerCount) out of \(elementList.count).")
    }
    
    if state == .score {
      displayScoreAlert()
    }
    
    
    showAnswerButton.isHidden = true
    if currentElementIndex == elementList.count - 1 {
      nextButton.setTitle("Show Score", for: .normal)
    } else {
      nextButton.setTitle("Next Question", for: .normal)
    }
    switch state {
    case .question:
      nextButton.isEnabled = false
    case .answer:
      nextButton.isEnabled = true
    case .score:
      nextButton.isEnabled = false
    }
  }
  
  
  func updateUI() {

    let elementName = elementList[currentElementIndex]
    let image = UIImage(named: elementName)
    imageView.image = image
    
    switch mode {
    case .flashCard:
      updateFlashCardUI(elementName: elementName)
    case .quiz:
      updateQuizUI(elementName: elementName)
    }
  }
  
  
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    let textFieldContents = textField.text!
    textField.resignFirstResponder()
    
    if textFieldContents.lowercased() ==
        elementList[currentElementIndex].lowercased () {
      answerIsCorrect = true
      correctAnswerCount += 1
    } else {
      answerIsCorrect = false
    }
    if answerIsCorrect {
      print("Correct!")
    } else {
      print("❌")
    }
    
    state = .answer
    
    updateUI()
    
    return true
  }
  
  
  func displayScoreAlert() {
    let alert = UIAlertController(title: "Quiz Score", message: "Your score is \(correctAnswerCount) out of \(elementList.count).", preferredStyle: .alert)
    
    let dismissAction = UIAlertAction(title: "OK", style: .default, handler: scoreAlertDismissed(_:))
    alert.addAction(dismissAction)
    
    present(alert, animated: true, completion: nil)
  }
  
  func scoreAlertDismissed(_ action: UIAlertAction) {
    mode = .flashCard
  }
  
  func setupFlashCards() {
    state = .question
    currentElementIndex = 0
    
    elementList = fixedElementList
  }
  
  func setupQuiz() {
    state = .question
    currentElementIndex = 0
    answerIsCorrect = false
    correctAnswerCount = 0
    
    elementList = fixedElementList.shuffled()
  }
  
  
  
}
