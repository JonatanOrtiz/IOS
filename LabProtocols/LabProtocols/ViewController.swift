//
//  ViewController.swift
//  LabProtocols
//
//  Created by Jonatan Eduardo de Araujo on 10/03/21.
//

import UIKit

class ViewController: UIViewController, HeartRateReceiverDelegate {
  
  @IBOutlet weak var labelBPM: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let receiver = HeartRateReceiver()
    receiver.delegate = self
    receiver.startHeartRateMonitoringExample()
  }
  
  func heartRateUpdated(to bpm: Int) {
    labelBPM.text = "\(bpm)"
    print(bpm)
  }
}

