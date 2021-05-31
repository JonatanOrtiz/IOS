//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Jonatan Eduardo de Araujo on 19/01/21.
//

import UIKit

class ViewController: UIViewController {
  // MARK: - Outlets
  @IBOutlet weak var chooseFlagLabel: UILabel!
  @IBOutlet weak var flag1: UIButton!
  @IBOutlet weak var flag2: UIButton!
  @IBOutlet weak var flag3: UIButton!
  @IBOutlet weak var scoreField: UILabel!
  
  // MARK: - Propriedades da classe
  var countries = [String]()
  var score = 0
  var correctAnswer = 0
  var askedQuestions = 0

  // MARK: - Ações do clique nas bandeiras
  @IBAction func buttonTapped(_ flag: UIButton) {
    var title: String
    
    if flag.tag == correctAnswer {
      title = "Resposta \(askedQuestions) de 10:\n\nCorreto!"
      score += 1
    } else {
      title = "Resposta \(askedQuestions) de 10:\n\nErrado! Essa é a bandeira do país:  \(countries[flag.tag].uppercased())"
    }
    
    if askedQuestions < 10 {
      let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
      alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
      present(alertController, animated: true)
    } else {
      let finalAlertController = UIAlertController(title: "Fim de jogo!\n", message: score > 6 ? "Seu score total foi de: \(score).\nParabés!" : "Seu score total foi de: \(score). \nVocê pode melhorar!", preferredStyle: .alert)
      finalAlertController.addAction(UIAlertAction(title: "Iniciar novo jogo", style: .default, handler: startNewGame))
      present(finalAlertController, animated: true)
    }
  }
  
  // MARK: - Métodos
  
  // Exibe as imagens de forma randomica
  func askQuestion(action: UIAlertAction! = nil) {
    
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
    chooseFlagLabel.text = "Clique na bandeira do país: \(countries[correctAnswer])"
    
    flag1.setImage(UIImage(named: countries[0]), for: .normal)
    flag2.setImage(UIImage(named: countries[1]), for: .normal)
    flag3.setImage(UIImage(named: countries[2]), for: .normal)
  
    scoreField.text = String(score)
    
    askedQuestions += 1
  }
  
  // Inicia um novo jogo
  func startNewGame(action: UIAlertAction) {
    score = 0
    askedQuestions = 0
    
    askQuestion()
  }
  
  // MARK: - Início da execução
  override func viewDidLoad() {
    super.viewDidLoad()
    
    countries = ["Estônia", "França", "Alemanha", "Irlanda", "Itália", "Mônaco", "Nigéria", "Polônia", "Russia", "Espanha", "Inglaterra", "USA"]
    
    flag1.layer.borderWidth = 1
    flag2.layer.borderWidth = 1
    flag3.layer.borderWidth = 1
    
    flag1.layer.borderColor = UIColor.lightGray.cgColor
    flag2.layer.borderColor = UIColor.lightGray.cgColor
    flag3.layer.borderColor = UIColor.lightGray.cgColor
    
    askQuestion()
  }
}
