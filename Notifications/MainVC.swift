//
//  MainVC.swift
//  Notifications
//
//  Created by Brennan Linse on 5/24/17.
//  Copyright © 2017 Brennan Linse. All rights reserved.
//

import UIKit
import UserNotifications

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Request permission
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) { (granted, error) in
            if granted {
                print("Notification access granted")
            } else {
                print(error.debugDescription)
            }
        }
        
        
    }
    
    func scheduleNotification(after seconds: TimeInterval, completion: @escaping (_ success: Bool) -> ()) {
        
        let notif = UNMutableNotificationContent()
        
        notif.title = "New notification title"
        notif.subtitle = "This is the subtitle!"
        notif.body = "This is the notification body. Blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah..."
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        
        let request = UNNotificationRequest(identifier: "NewNotification", content: notif, trigger: notifTrigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let err = error {
                print(err)
                completion(false)
            } else {
                completion(true)
            }
        }
        
        
        
        
    }
    
    
    
    
    
    @IBAction func notifyButtonPressed(_ sender: UIButton) {
        scheduleNotification(after: 10) { (success) in
            if success {
                print("Successfully scheduled the notification")
            } else {
                print("Error scheduling the notification")
            }
        }
    }

}

