//
//  ViewModel.swift
//  ElementQuiz
//
//  Created by Jonatan Eduardo de Araujo on 26/03/21.
//

import RxSwift

class ViewModel {
  
  let disposeBag = DisposeBag()
  
  // MARK: - properties
  var endOfGame = false
  var answerIsCorrect = false
  var correctAnswerCount = 0
  var currentElementIndex = 0
  var elementName = ""
  var elementList: [String] = [""]
  let fixedElementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
  let elementNameSubject = BehaviorSubject<String>(value: "Carbon")
  let gameModeSubject = BehaviorSubject<Int>(value: 0)
  let gameStateSubject = BehaviorSubject<State>(value: .question)
  var mode: Mode = .flashCard
  
  // MARK: -
  func next() {
    currentElementIndex += 1
    if currentElementIndex >= elementList.count {
      currentElementIndex = 0
      if mode == .quiz {
        gameStateSubject.onNext(.score)
        updateGame()
        return
      }
    }
    gameStateSubject.onNext(.question)
  }
  
  // MARK: -
  func switchModes(_ index: Int) {
    if index == 1 {
      mode = .quiz
    }
    gameModeSubject.onNext(index)
  }
  
  // MARK: -
  func updateGame() {
    elementName = elementList[currentElementIndex]
    elementNameSubject.onNext(elementName)
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
    if textFieldContents.lowercased() == elementList[currentElementIndex].lowercased() {
      answerIsCorrect = true
      correctAnswerCount += 1
    } else {
      answerIsCorrect = false
    }
    gameStateSubject.onNext(.answer)
  }
  
  // MARK: -
  func scoreAlertDismissed() {
    gameModeSubject.onNext(0)
  }

  // MARK: -
  init() {
    gameModeSubject.onNext(0)
    updateGame()
    gameModeSubject.bind { gameMode in
      if gameMode == 0 {
        self.elementList = self.fixedElementList
        self.gameStateSubject.onNext(.question)
        self.currentElementIndex = 0
      } else {
        self.elementList = self.fixedElementList.shuffled()
        self.gameStateSubject.onNext(.question)
        self.currentElementIndex = 0
        self.answerIsCorrect = false
        self.correctAnswerCount = 0
      }
      self.elementName = self.elementList[self.currentElementIndex]
      self.elementNameSubject.onNext(self.elementName)
      if self.mode == .quiz {
        self.updateQuiz()
      }
      self.updateGame()
    }.disposed(by: disposeBag)
    gameStateSubject.bind { _ in
      print("estado mudou \(Int.random(in: 0..<100))")
      self.updateGame()
    }.disposed(by: disposeBag)
  }
  
}
