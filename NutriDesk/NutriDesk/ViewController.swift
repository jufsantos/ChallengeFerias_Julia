//
//  ViewController.swift
//  NutriDesk
//
//  Created by Julia Santos on 10/07/19.
//  Copyright © 2019 Julia Santos. All rights reserved.
//

import UIKit
import UserNotifications



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        
        content.title = "Ei, nutricionista!"
        content.subtitle = "Tenha em mãos todos os seus pacientes!"
        content.body = "Cadastre-os no aplicativo para acessar suas informações de forma rápida e prática."
        content.sound = UNNotificationSound.default
        content.threadIdentifier = "Local-notifications temp"
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
        
        let request = UNNotificationRequest(identifier: "content", content: content, trigger: trigger)
        
        center.add(request) { (error) in
            if error != nil {
                print(error!)
            }
        }
    }
}

