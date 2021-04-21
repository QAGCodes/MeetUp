//
//  CreateProfileViewController.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 4/20/21.
//

import UIKit
import Parse

class CreateProfileViewController: ViewController {

    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var displayNameField: UITextField!
    @IBOutlet weak var collegeField: UITextField!
    @IBOutlet weak var majorField: UITextField!
    @IBOutlet weak var bioField: UITextField!
    @IBOutlet weak var interestsField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = PFUser.current()
        let firstName = user?["firstname"] as! String
        let lastName = user?["lastname"] as! String
        fullnameLabel.text = firstName + lastName
        displayNameField.text = user!["username"] as! String
    }
    

    @IBAction func onSaveButton(_ sender: Any) {
        let query = PFQuery(className: "Profile")
        let user = PFUser.current()
        let userid = user?.objectId as! String
        query.getObjectInBackground(withId: userid){(profile:PFObject?, error:Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let profile = profile{
                profile["dispname"] = self.displayNameField.text!
                profile["college"] = self.collegeField.text!
                profile["bio"] = self.bioField.text!
                profile["interests"] = self.interestsField.text!
                profile.saveInBackground()
                print("success")
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
