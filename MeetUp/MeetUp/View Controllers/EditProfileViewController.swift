//
//  EditProfileViewController.swift
//  MeetUp
//
//  Created by Ayushman Singh on 4/3/21.
//

import UIKit
import Parse

class EditProfileViewController: UIViewController {

    @IBOutlet var fullNameField: UITextField!
    @IBOutlet var dispNameField: UITextField!
    @IBOutlet var collegeField: UITextField!
    @IBOutlet var majorField: UITextField!
    @IBOutlet var bioField: UITextField!
    @IBOutlet var interestsField: UITextField!
    @IBOutlet weak var profilePictureField: UIImageView!
    
    
    let user = PFUser.current()
    
    func newProfile() {
        let profile = PFObject(className: "Profile")
        profile["fullname"] = fullNameField.text
        profile["dispname"] = dispNameField.text
        profile["college"] = collegeField.text
        profile["major"] = majorField.text
        profile["bio"] = bioField.text
        profile["interests"] = interestsField.text
        profile["user"] = user
        profile.saveInBackground { (succeeded, error) in
            if succeeded {
                print("Object has been saved")
            } else {
                print("There was an error while saving object")
            }
        }
        
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let query = PFQuery(className: "Profile")
        query.whereKey("user", equalTo: user as Any)
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) profiles.")
                // Do something with the found objects
                if objects.count == 0 {
                    self.newProfile()
                } else {
                    let profile = objects[0]
                    profile["fullname"] = self.fullNameField.text
                    profile["dispname"] = self.dispNameField.text
                    profile["college"] = self.collegeField.text
                    profile["major"] = self.majorField.text
                    profile["bio"] = self.bioField.text
                    profile["interests"] = self.interestsField.text
                    profile["user"] = self.user
                    profile.saveInBackground { (succeeded, error) in
                        if succeeded {
                            print("Object has been saved")
                        } else {
                            print("There was an error while saving object")
                        }
                    }
                }
            }
        }

        self.dismiss(animated: true) {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePictureField.layer.masksToBounds = false
        profilePictureField.layer.cornerRadius = profilePictureField.frame.height/2
            profilePictureField.clipsToBounds = true
        
        let query = PFQuery(className: "Profile")
        query.whereKey("user", equalTo: user as Any)
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) profiles.")
                // Do something with the found objects
                if objects.count > 0 {
                    self.fullNameField.attributedText = NSAttributedString(string: objects[0]["fullname"] as! String)
                    self.dispNameField.attributedText = NSAttributedString(string: objects[0]["dispname"] as! String)
                    self.collegeField.attributedText = NSAttributedString(string: objects[0]["college"] as! String)
                    self.majorField.attributedText = NSAttributedString(string: objects[0]["major"] as! String)
                    self.bioField.attributedText = NSAttributedString(string: objects[0]["bio"] as! String)
                    self.interestsField.attributedText = NSAttributedString(string: objects[0]["interests"] as! String)
                }
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    
}
