import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  // MARK: -
  let viewModel = ViewModel()
  
  // MARK: - properties
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var answerLabel: UILabel!
  @IBOutlet weak var modeSelector: UISegmentedControl!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var showAnswerButton: UIButton!
  @IBOutlet weak var nextButton: UIButton!
  
  // MARK: -
  @IBAction func showAnswer(_ sender: Any) {
    viewModel.showAnswer()
  }
  
  // MARK: -
  @IBAction func next(_ sender: Any) {
    viewModel.next()
  }
  
  // MARK: -
  @IBAction func switchModes(_ sender: UISegmentedControl) {
    viewModel.switchModes(sender.selectedSegmentIndex)
  }
  
  // MARK: -
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    let textFieldContents = textField.text!.lowercased()
    viewModel.checkAnswer(textFieldContents)
    return true
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
  func updateFlashCardUI(_ state: String) {
    showAnswerButton.isHidden = false
    nextButton.isEnabled = true
    nextButton.setTitle("Next Element", for: .normal)
    textField.isHidden = true
    textField.resignFirstResponder()
    if state == "answer" {
      self.answerLabel.text = self.viewModel.elementName.value
    } else {
      self.answerLabel.text = "?"
    }
  }
  
  // MARK: -
  func updateQuizUI(_ state: String) {
    showAnswerButton.isHidden = true
    textField.isHidden = false
    if self.viewModel.endOfGame == true {
      nextButton.setTitle("Show Score", for: .normal)
    } else {
      nextButton.setTitle("Next Question", for: .normal)
    }
    switch state {
    case "question":
      nextButton.isEnabled = false
      answerLabel.text = ""
      textField.isEnabled = true
      textField.text = ""
      textField.becomeFirstResponder()
    case "answer":
      nextButton.isEnabled = true
      if self.viewModel.answerIsCorrect == true {
        answerLabel.text = "Correct!"
      } else {
        answerLabel.text = "❌\nCorrect Answer: " + self.viewModel.elementName.value
      }
      textField.isEnabled = false
      textField.resignFirstResponder()
    case "score":
      nextButton.isEnabled = false
      answerLabel.text = ""
      textField.isEnabled = true
      textField.isHidden = true
      textField.resignFirstResponder()
      displayScoreAlert()
    default:
      return
    }
  }
  
  // MARK: -
  override func viewDidLoad() {
    
    viewModel.elementName.bind { [weak self] elementName in
      self?.imageView.image = UIImage(named: elementName)
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
        self.modeSelector.selectedSegmentIndex = 0
        self.updateFlashCardUI("question")
      } else {
        self.modeSelector.selectedSegmentIndex = 1
        self.updateQuizUI("question")
      }
    }
    
  }
}
