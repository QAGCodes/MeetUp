//
//  LoginViewController.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 4/7/21.
//

import UIKit
import Parse

class LoginViewController: ViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var User = [PFObject]()
    var success = false
    //Name of segue to invite stream
    var loginSegueToStream = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginPressed(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
    
        let query = PFQuery(className:"users")
        query.includeKeys(["username","password"])
        
        query.findObjectsInBackground{(users, error) in
            if users != nil{
                self.User = users!
                for user in self.User {
                    if(user["username"] as! String == username){
                        self.success = true
                    }else{
                        continue
                    }
                    
                    if(self.success == true){
                        if(user["password"] as! String == password){
                            print("Login Successful")
                           // self.performSegue(withIdentifier: self.loginSegueToStream, sender: self)
                        }else{
                            self.errorLoggingIn(text: "Invalid Password")
                            self.success = false
                        }
                    }
                }
                
                if self.success == false {
                    self.errorLoggingIn(text: "Username doesn't exist")
                }
            }
        }
        
       
    }
        
    func errorLoggingIn(text:String){
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
