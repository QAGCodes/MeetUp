//
//  LoginVIewController.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 3/28/21.
//

import UIKit
import Parse


class LoginVIewController: ViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    var User = [PFObject]()
    var success = false
    
    // Add the identifier of the segue to invite stream
    var loginSegueToStream = "InviteStream"
    
    
    @IBAction func userLogin(_ sender: Any) {
        let username = usernameField.text!
        let password = PasswordField.text!
    
        let query = PFQuery(className:"users")
        query.includeKeys(["username","password"])
        
        query.findObjectsInBackground{(users, error) in
            if users != nil{
                self.User = users!
                for user in self.User {
                    if(user["username"] as! String == username){
                        self.success = true
                    }else{
                        self.errorLoggingIn(text: "Username doesn't exist")
                    }
                    
                    if(self.success == true){
                        if(user["password"] as! String == password){
                            self.performSegue(withIdentifier: self.loginSegueToStream, sender: self)
                        }else{
                            self.errorLoggingIn(text: "Invalid Password")
                            self.success = false
                        }
                    }

                }
            }
        }
//        print(username!)
  //      print(password!)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
