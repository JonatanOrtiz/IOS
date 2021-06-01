//
//  ViewModel.swift
//  ElementQuiz
//
//  Created by Jonatan Eduardo de Araujo on 26/03/21.
//

class ViewModel {
  
  // MARK: - properties
  var endOfGame = false
  var answerIsCorrect = false
  var correctAnswerCount = 0
  var currentElementIndex = 0
  var mode: Mode = .flashCard {
    didSet {
      switch mode {
      case .flashCard:
        gameMode.value = 0
        setupFlashCards()
      case .quiz:
        gameMode.value = 1
        setupQuiz()
      }
      updateGame()
    }
  }
  var state: State = .question {
    didSet {
      switch state {
      case .answer:
        gameState.value = "answer"
      case .question:
        gameState.value = "question"
      case .score:
        gameState.value = "score"
      }
    }
  }
  var elementName = Box("")
  var gameMode = Box(0)
  var gameState = Box("question")
  var elementList: [String] = []
  let fixedElementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
  
  // MARK: -
  func showAnswer() {
    state = .answer
    updateGame()
  }
  
  // MARK: -
  func next() {
    currentElementIndex += 1
    if currentElementIndex >= elementList.count {
      currentElementIndex = 0
      if mode == .quiz {
        state = .score
        updateGame()
        return
      }
    }
    state = .question
    updateGame()
  }
  
  // MARK: -
  func switchModes(_ index: Int) {
    if index == 0 {
      mode = .flashCard
    } else {
      mode = .quiz
    }
    updateGame()
  }
  
  // MARK: -
  func updateGame() {
    elementName.value = elementList[currentElementIndex]
    if mode == .quiz {
      updateQuiz()
    }
  }
  
  // MARK: -
  func updateQuiz() {
    if currentElementIndex == elementList.count - 1 {
      endOfGame = true
    } else {
      endOfGame = false
    }
  }
  
  // MARK: -
  func checkAnswer(_ textFieldContents: String) {
    if textFieldContents == elementList[currentElementIndex].lowercased() {
      answerIsCorrect = true
      correctAnswerCount += 1
    } else {
      answerIsCorrect = false
    }
    state = .answer
    updateGame()
  }
  
  // MARK: -
  func scoreAlertDismissed() {
    mode = .flashCard
    updateGame()
  }
  
  // MARK: -
  func setupFlashCards() {
    elementList = fixedElementList
    state = .question
    currentElementIndex = 0
  }
  
  // MARK: -
  func setupQuiz() {
    elementList = fixedElementList.shuffled()
    state = .question
    currentElementIndex = 0
    answerIsCorrect = false
    correctAnswerCount = 0
  }

  // MARK: -
  init() {
    mode = .flashCard
    setupFlashCards()
    updateGame()
  }
  
}
