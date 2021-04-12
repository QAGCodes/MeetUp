//
//  CreateInviteViewController.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 4/11/21.
//

import UIKit
import Parse

class CreateInviteViewController: ViewController {

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    @IBOutlet weak var notesTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPostButton(_ sender: Any) {
        let location = locationTextField.text!
        let dateAndTime = dateTimePicker.date
        let notes = notesTextField.text!
        
        let time = dateAndTime.description.components(separatedBy: " ")[1]
        
        let invite = PFObject(className: "invites")
        invite["location"] = location
        invite["invite_details"] = notes
        invite["date"] = dateAndTime
        invite["time"] = time
        invite["status"] = false
        invite["userid"] = PFUser.current()!
        
        invite.saveInBackground{(success, error) in
            if success {
                self.successPostingInvite(text: "Invite added to Database!")
                print("saved!")
            }else{
                print("error!")
            }
        }
    }
    
    func successPostingInvite(text:String){
        let alertView = UIAlertController(title: "Success!", message: text, preferredStyle: .alert)
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
