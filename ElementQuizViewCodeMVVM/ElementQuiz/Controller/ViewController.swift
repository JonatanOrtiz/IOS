
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  // MARK: -
  var viewModel = ViewModel()
  var views = View()
  
  // MARK: -
  func setupSegmentedControl() {
    views.modeSelector.translatesAutoresizingMaskIntoConstraints = false
    views.modeSelector.insertSegment(withTitle: "Flash Cards", at: 0, animated: true)
    views.modeSelector.insertSegment(withTitle: "Quiz", at: 1, animated: true)
    views.modeSelector.centerXAnchor.constraint(equalTo: views.masterStackView.centerXAnchor, constant:0).isActive = true
    views.modeSelector.selectedSegmentIndex = 0
  }
  
  // MARK: -
  func setupMasterStack() {
    views.masterStackView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate (
      [views.masterStackView.widthAnchor.constraint(equalToConstant: 350),
       views.masterStackView.heightAnchor.constraint(equalToConstant: 432),
       views.masterStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       views.masterStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130)
      ])
  }
  
  // MARK: -
  func displayScoreAlert() {
    let alert = UIAlertController(title: "Quiz Score", message: "Your score is \(viewModel.correctAnswerCount) out of \(viewModel.fixedElementList.count).", preferredStyle: .alert)
    
    let dismissAction = UIAlertAction(title: "OK", style: .default, handler: scoreAlertDismissed(_:))
    alert.addAction(dismissAction)
    
    present(alert, animated: true, completion: nil)
  }
  
  // MARK: -
  func scoreAlertDismissed(_ action: UIAlertAction) {
    viewModel.scoreAlertDismissed()
  }


  // MARK: -
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    let textFieldContents = textField.text!.lowercased()
    viewModel.checkAnswer(textFieldContents)
    return true
  }
  
  // MARK: -
  func updateFlashCardUI(_ state: String) {
    views.showAnswerButton.isHidden = false
    views.nextButton.isEnabled = true
    views.nextButton.setTitle("Next Element", for: .normal)
    views.textField.isHidden = true
    views.textField.resignFirstResponder()
    if state == "answer" {
      views.answerLabel.text = self.viewModel.elementName.value
    } else {
      views.answerLabel.text = "?"
    }
  }
  
  // MARK: -
  func updateQuizUI(_ state: String) {
    views.showAnswerButton.isHidden = true
    views.textField.isHidden = false
    if self.viewModel.endOfGame == true {
      views.nextButton.setTitle("Show Score", for: .normal)
    } else {
      views.nextButton.setTitle("Next Question", for: .normal)
    }
    switch state {
    case "question":
      views.nextButton.isEnabled = false
      views.answerLabel.text = ""
      views.textField.isEnabled = true
      views.textField.text = ""
      views.textField.becomeFirstResponder()
    case "answer":
      views.nextButton.isEnabled = true
      if self.viewModel.answerIsCorrect == true {
        views.answerLabel.text = "Correct!"
      } else {
        views.answerLabel.text = "❌\nCorrect Answer: " + self.viewModel.elementName.value
      }
      views.textField.isEnabled = false
      views.textField.resignFirstResponder()
    case "score":
      views.nextButton.isEnabled = false
      views.answerLabel.text = ""
      views.textField.isEnabled = true
      views.textField.isHidden = true
      views.textField.resignFirstResponder()
      displayScoreAlert()
    default:
      return
    }
  }
  
  // MARK: -
  @objc func showAnswer() {
    viewModel.showAnswer()
  }
  
  // MARK: -
  @objc func showNext() {
    viewModel.next()
  }
  
  // MARK: -
  @objc func switchModes() {
    viewModel.switchModes(views.modeSelector.selectedSegmentIndex)
  }
  
  func buttonsAddTarget() {
    views.showAnswerButton.addTarget(self, action: #selector(showAnswer), for: .touchUpInside)
    views.nextButton.addTarget(self, action: #selector(showNext), for: .touchUpInside)
    views.modeSelector.addTarget(self, action: #selector(switchModes), for: .valueChanged)
  }
  
  // MARK: -
  override func viewDidLoad() {
    
    viewModel.elementName.bind { [weak self] elementName in
      self?.views.imageView.image = UIImage(named: elementName)
    }
    
    viewModel.gameState.bind { state in
      if self.viewModel.gameMode.value == 0 {
        self.updateFlashCardUI(state)
      } else {
        self.updateQuizUI(state)
      }
    }
    
    viewModel.gameMode.bind { mode in
      if mode == 0 {
        self.views.modeSelector.selectedSegmentIndex = 0
        self.updateFlashCardUI("question")
      } else {
        self.views.modeSelector.selectedSegmentIndex = 1
        self.updateQuizUI("question")
      }
    }
    
    view.backgroundColor = .white
    view.addSubview(views.masterStackView)
    
    setupSegmentedControl()
    setupMasterStack()
    buttonsAddTarget()
    
    views.textField.delegate = self
    
  }
}

