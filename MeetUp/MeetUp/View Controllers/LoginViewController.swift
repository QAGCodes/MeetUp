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
    var loginSegueToStream = "loginToInviteStream"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Looks for single or multiple taps.
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }
    

    
    @IBAction func onBackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if(user != nil){
                let installation = PFInstallation.current()
                if installation != nil{
                    installation?.setValue( PFUser.current()?.objectId, forKey: "userId")
                    installation?.saveInBackground()
                }

                self.performSegue(withIdentifier: self.loginSegueToStream, sender: nil)
            }else{
                self.errorLoggingIn(text:"Error: \(error?.localizedDescription)")
                print("Error: \(error?.localizedDescription)")
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
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}
