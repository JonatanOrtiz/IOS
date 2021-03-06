//
//  Box.swift
//  ElementQuiz
//
//  Created by Jonatan Eduardo de Araujo on 26/03/21.
//

import Foundation

class Box<T> {
  
  typealias Listener = (T) -> Void
  
  var listener: Listener?
  
  var value: T {
    didSet {
      listener?(value)
    }
  }
  
init(_ value: T) {
    self.value = value
  }
  
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}
