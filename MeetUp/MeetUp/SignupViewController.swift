//
//  SignupViewController.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 4/7/21.
//

import UIKit
import Parse

class SignupViewController: ViewController {

    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    
    @IBAction func signupPressed(_ sender: Any) {
        let firstName = firstnameField.text!
        let lastName = lastnameField.text!
        let username = usernameField.text!
        let password = passwordField.text!
        
        let user = PFObject(className: "users")
        user["username"] = username
        user["firstName"] = firstName
        user["lastName"] = lastName
        user["password"] = password
        
        
        
        user.saveInBackground{(success, error) in
            if success {
                print("Signup successful")
                //self.performSegue(withIdentifier: "InviteStream", sender: nil)
            }else{
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
