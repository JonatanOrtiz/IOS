//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Jonatan Eduardo de Araujo on 03/03/21.
//

import UIKit

class QuestionViewController: UIViewController {
  
  @IBOutlet var questionLabel: UILabel!
  
  @IBOutlet var singleStackView: UIStackView!
  @IBOutlet var singleButton1: UIButton!
  @IBOutlet var singleButton2: UIButton!
  @IBOutlet var singleButton3: UIButton!
  @IBOutlet var singleButton4: UIButton!
  
  @IBOutlet var multipleStackView: UIStackView!
  @IBOutlet var multiLabel1: UILabel!
  @IBOutlet var multiLabel2: UILabel!
  @IBOutlet var multiLabel3: UILabel!
  @IBOutlet var multiLabel4: UILabel!
  
  @IBOutlet var multiSwitch1: UISwitch!
  @IBOutlet var multiSwitch2: UISwitch!
  @IBOutlet var multiSwitch3: UISwitch!
  @IBOutlet var multiSwitch4: UISwitch!
  
  @IBOutlet var rangedStackView: UIStackView!
  @IBOutlet var rangedLabel1: UILabel!
  @IBOutlet var rangedLabel2: UILabel!
  
  @IBOutlet weak var rangedSlider: UISlider!
  
  @IBOutlet var questionProgressView: UIProgressView!
  
  @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
    let currentAnswers = questions[questionIndex].answers
    
    switch sender {
    case singleButton1:
      answersChosen.append(currentAnswers[0])
    case singleButton2:
      answersChosen.append(currentAnswers[1])
    case singleButton3:
      answersChosen.append(currentAnswers[2])
    case singleButton4:
      answersChosen.append(currentAnswers[3])
    default:
      break
    }
    nextQuestion()
  }
  
  @IBAction func multipleAnswerButtonPressed() {
    let currentAnswers = questions[questionIndex].answers
    
    if multiSwitch1.isOn {
      answersChosen.append(currentAnswers[0])
    }
    if multiSwitch2.isOn {
      answersChosen.append(currentAnswers[1])
    }
    if multiSwitch3.isOn {
      answersChosen.append(currentAnswers[2])
    }
    if multiSwitch4.isOn {
      answersChosen.append(currentAnswers[3])
    }
    
    nextQuestion()
  }
  
  @IBAction func rangedAnswerButtonPressed() {
    let currentAnswers = questions[questionIndex].answers
    let index = Int(round(rangedSlider.value *
                            Float(currentAnswers.count - 1)))
    
    answersChosen.append(currentAnswers[index])
    
    nextQuestion()
  }
  
  @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
    return ResultsViewController(coder: coder, responses:
                                  answersChosen)
  }
  
  var answersChosen: [Answer] = []
  var questionIndex = 0
  
  var questions: [Question] = [
    Question(
      text: "De qual comida você mais gosta?",
      type: .single,
      answers: [
        Answer(text: "Carnes", type: .dog),
        Answer(text: "Peixes", type: .cat),
        Answer(text: "Cenouras", type: .rabbit),
        Answer(text: "Sementes", type: .turtle)
      ]
    ),
    Question(
      text: "De quais atividades você gosta mais?",
      type: .multiple,
      answers: [
        Answer(text: "Nadar", type: .turtle),
        Answer(text: "Dormir", type: .cat),
        Answer(text: "Carinho", type: .rabbit),
        Answer(text: "Comer", type: .dog)
      ]
    ),
    Question(
      text: "Quanto você gosta de passear de carro?",
      type: .ranged,
      answers: [
        Answer(text: "Não gosto", type: .cat),
        Answer(text: "Fico um pouco nervoso", type: .rabbit),
        Answer(text: "Não faz diferença", type: .turtle),
        Answer(text: "Eu amo!", type: .dog)
      ]
    )
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
  }
  
  func updateUI() {
    singleStackView.isHidden = true
    multipleStackView.isHidden = true
    rangedStackView.isHidden = true
    
    let currentQuestion = questions[questionIndex]
    let currentAnswers = currentQuestion.answers
    let totalProgress = Float(questionIndex) /
      Float(questions.count)
    
    navigationItem.title = "Pergunta #\(questionIndex + 1)"
    questionLabel.text = currentQuestion.text
    questionProgressView.setProgress(totalProgress, animated:
                                      true)
    
    switch currentQuestion.type {
    case .single:
      updateSingleStack(using: currentAnswers)
    case .multiple:
      updateMultipleStack(using: currentAnswers)
    case .ranged:
      updateRangedStack(using: currentAnswers)
    }
  }
  
  func updateSingleStack(using answers: [Answer]) {
    singleStackView.isHidden = false
    singleButton1.setTitle(answers[0].text, for: .normal)
    singleButton2.setTitle(answers[1].text, for: .normal)
    singleButton3.setTitle(answers[2].text, for: .normal)
    singleButton4.setTitle(answers[3].text, for: .normal)
  }
  
  func updateMultipleStack(using answers: [Answer]) {
    multipleStackView.isHidden = false
    multiSwitch1.isOn = false
    multiSwitch2.isOn = false
    multiSwitch3.isOn = false
    multiSwitch4.isOn = false
    multiLabel1.text = answers[0].text
    multiLabel2.text = answers[1].text
    multiLabel3.text = answers[2].text
    multiLabel4.text = answers[3].text
  }
  
  func updateRangedStack(using answers: [Answer]) {
    rangedStackView.isHidden = false
    rangedSlider.setValue(0.5, animated: false)
    rangedLabel1.text = answers.first?.text
    rangedLabel2.text = answers.last?.text
  }
  
  func nextQuestion() {
    questionIndex += 1
    
    if questionIndex < questions.count {
      updateUI()
    } else {
      performSegue(withIdentifier: "Results", sender: nil)
    }
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
