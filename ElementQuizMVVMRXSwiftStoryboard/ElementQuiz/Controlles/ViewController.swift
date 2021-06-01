import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITextFieldDelegate {
  
  // MARK: -
  let viewModel = ViewModel()
  let disposeBag = DisposeBag()
  
  // MARK: - properties
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var answerLabel: UILabel!
  @IBOutlet weak var modeSelector: UISegmentedControl!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var showAnswerButton: UIButton!
  @IBOutlet weak var nextButton: UIButton!
  
  let answerLabelSubject = PublishSubject<String>()

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
  func updateFlashCardUI() {
    showAnswerButton.isHidden = false
    nextButton.isEnabled = true
    nextButton.setTitle("Next Element", for: .normal)
    textField.isHidden = true
    textField.resignFirstResponder()
    answerLabelSubject.onNext("?")
  }
  
  // MARK: -
  func updateQuizUI(_ state: State) {
    showAnswerButton.isHidden = true
    textField.isHidden = false
    if self.viewModel.endOfGame == true {
      nextButton.setTitle("Show Score", for: .normal)
    } else {
      nextButton.setTitle("Next Question", for: .normal)
    }
    switch state {
    case .question:
      nextButton.isEnabled = false
      answerLabelSubject.onNext("")
      textField.isEnabled = true
      textField.text = ""
      textField.becomeFirstResponder()
    case .answer:
      nextButton.isEnabled = true
      if self.viewModel.answerIsCorrect == true {
        answerLabelSubject.onNext("Correct!")
      } else {
        answerLabelSubject.onNext("❌\nCorrect Answer: " + self.viewModel.elementName)
      }
      textField.isEnabled = false
      textField.resignFirstResponder()
    case .score:
      nextButton.isEnabled = false
      answerLabelSubject.onNext("")
      textField.isEnabled = true
      textField.isHidden = true
      textField.resignFirstResponder()
      displayScoreAlert()
    }
  }
  
  func showAnswer() {
    answerLabelSubject.onNext(self.viewModel.elementName)
  }
  
  // MARK: -
  override func viewDidLoad() {
    
    nextButton.rx.tap.subscribe(onNext: { [weak self] in
      self?.viewModel.next()
    }).disposed(by: disposeBag)
    
    showAnswerButton.rx.tap.subscribe(onNext: { [weak self] in
      self?.showAnswer()
    }).disposed(by: disposeBag)
    
    textField.rx.controlEvent(.editingDidEndOnExit).subscribe(onNext: { [weak self] in
      self?.viewModel.checkAnswer(self?.textField.text ?? "")
    }).disposed(by: disposeBag)
    
    modeSelector.rx.selectedSegmentIndex.subscribe(onNext: { [weak self] in
      self?.viewModel.switchModes($0)
    }).disposed(by: disposeBag)
    
    viewModel.elementNameSubject.map { UIImage(named: $0) }.bind(to: imageView.rx.image).disposed(by: disposeBag)
    
    answerLabelSubject.bind(to: answerLabel.rx.text).disposed(by: disposeBag)
    
    viewModel.gameStateSubject.subscribe(onNext: { [weak self] in
      if self?.modeSelector.selectedSegmentIndex == 0 {
      self?.updateFlashCardUI()
      } else {
        self?.updateQuizUI($0)
      }
    }).disposed(by: disposeBag)
    
    viewModel.gameModeSubject.subscribe(onNext: { [weak self] in
      self?.modeSelector.selectedSegmentIndex = $0
      if $0 == 0 {
        self?.updateFlashCardUI()
      } else {
        self?.updateQuizUI(.question)
      }
    }).disposed(by: disposeBag)
    
  }
}
