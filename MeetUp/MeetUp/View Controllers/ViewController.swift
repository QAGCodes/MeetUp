//
//  ViewController.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 4/7/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//            if let error = error {
//                // Handle the error here.
//            }
        // Enable or disable features based on the authorization.
        }
    }


}

