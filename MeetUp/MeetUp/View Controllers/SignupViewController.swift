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
       
        
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user["firstname"] = firstName
        user["lastname"] = lastName
        

    
        
        if(firstName.count == 0 || lastName.count == 0 || passwordField.text?.count == 0 || usernameField.text?.count == 0){
            self.errorSigningUp(text: "One of the fields is blank!")
            return
        } else if(passwordField.text?.count ??  0 < 6){
            self.errorSigningUp(text: "Password must be atleast 6 characters long")
            return
        }
        
        user.signUpInBackground{(success, error) in
            if success {
                PFUser.logInWithUsername(inBackground: self.usernameField.text!, password: self.passwordField.text!) { (user, error) in
                    if(user != nil){
                        self.performSegue(withIdentifier: "toProfileSegue", sender: nil)
                    }else{
                        self.errorSigningUp(text:"Error: \(error?.localizedDescription)")
                        print("Error: \(error?.localizedDescription)")
                    }
                }
            }else{
                self.errorSigningUp(text: "Error: \(error?.localizedDescription)")
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
    
    func errorSigningUp(text:String){
        let alertView = UIAlertController(title: "Error!", message: text, preferredStyle: .alert)
             let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
             }
             alertView.addAction(OKAction)
             if let presenter = alertView.popoverPresentationController {
                 presenter.sourceView = self.view
                 presenter.sourceRect = self.view.bounds
             }
             self.present(alertView, animated: true, completion:nil)
    }

}
