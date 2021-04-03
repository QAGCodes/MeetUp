//
//  ViewController.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 3/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func gotoLogin(_ sender: Any) {
        performSegue(withIdentifier: "loginSegue", sender: self)
    }
    @IBAction func gotoSignUp(_ sender: Any) {
        performSegue(withIdentifier: "signupSegue", sender: self)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

