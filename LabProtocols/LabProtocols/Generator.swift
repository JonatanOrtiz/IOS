//
//  Generator.swift
//  LabProtocols
//
//  Created by Jonatan Eduardo de Araujo on 10/03/21.
//

import Foundation

protocol HeartRateReceiverDelegate {
  func heartRateUpdated(to bpm: Int)
}

class HeartRateReceiver {
  var currentHR: Int? {
    didSet {
      if let currentHR = currentHR {
        print("The most recent heart rate reading is \(currentHR).")
        delegate?.heartRateUpdated(to: currentHR)
      } else {
        print("Looks like we can't pick up a heart rate.")
      }
    }
  }
  
  var delegate: HeartRateReceiverDelegate?
  
  func startHeartRateMonitoringExample() {
      for i in 1...10 {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(i)) {
        let randomHR = 60 + Int(arc4random_uniform(UInt32(15)))
        self.currentHR = randomHR
        }
    }
  }
}
