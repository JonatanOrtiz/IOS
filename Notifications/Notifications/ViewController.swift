//
//  ViewController.swift
//  Notifications
//
//  Created by Jonatan Eduardo de Araujo on 12/04/21.
//

import UIKit

class ViewController: UIViewController {
  
  let center = UNUserNotificationCenter.current()
  let content = UNMutableNotificationContent()
  
  func configNotification() {
    content.sound = UNNotificationSound.default      // to add a sound
    content.badge = 2                                // to add a badge
    content.title = "Snooze Ended"
    content.body = "Wake Up!"
    
    let timeIntervalTrigger =
       UNTimeIntervalNotificationTrigger(timeInterval:
       60 * 5, repeats: false)
    
    // 3. Notification Request
    let request = UNNotificationRequest(identifier: "Snooze",
       content: content, trigger: timeIntervalTrigger)
    
    UNUserNotificationCenter.current().add(request) { (error: Error?) in
        if let error = error {
            print(error.localizedDescription)
        }
    }
  }
  
  func requestAuthorization() {
    center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted: Bool, error: Error?) in
        if let error = error {
            // handle error
        } else {
            // enable or disable features based on authorization
        }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configNotification()
    requestAuthorization()
  }

}
