//
//  EditInviteViewController.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 4/18/21.
//

import UIKit
import Parse

class EditInviteViewController: ViewController {
    
    var invite : PFObject!

    @IBAction func onCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func onPostButton(_ sender: Any) {
        
        let query = PFQuery(className: "invites")
        query.getObjectInBackground(withId: self.invite["objectId"] as! String){(invite:PFObject?, error:Error?) in
            if let error = error {
                print(error.localizedDescription)
            }  else if let invite = invite{
                let location = self.locationTextField.text!
                let dateAndTime = self.dateTimePicker.date
                let notes = self.notesTextField.text!
                
                let time = dateAndTime.description.components(separatedBy: " ")[1]
                invite["location"] = location
                invite["invite_details"] = notes
                invite["date"] = dateAndTime
                invite["time"] = time
                invite.saveInBackground{(success, error) in
                    if success {
                        self.dismiss(animated: true, completion: nil)
                    }else{
                        print("error!")
                    }
                }
            }
        
        
        
    }
    }
   
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var notesTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationTextField.text = invite["location"] as! String
        
        notesTextField.text = invite["invite_details"] as! String
        
        // Do any additional setup after loading the view.
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
