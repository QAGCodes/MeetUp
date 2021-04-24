//
//  UserProfileViewController.swift
//  MeetUp
//
//  Created by Ayushman Singh on 4/3/21.
//

import UIKit
import Parse

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var ProfilePicture: UIImageView!
    @IBOutlet weak var FullName: UILabel!
    @IBOutlet weak var UniversityName: UILabel!
    @IBOutlet weak var BioText: UILabel!
    @IBOutlet weak var InterestsText: UILabel!
    @IBOutlet weak var CreateInviteButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        ProfilePicture.layer.masksToBounds = false
        ProfilePicture.layer.cornerRadius = ProfilePicture.frame.height/2
            ProfilePicture.clipsToBounds = true
        
        let user = PFUser.current()
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
                    self.FullName.text = objects[0]["fullname"] as? String
                    self.UniversityName.text = objects[0]["college"] as? String
                    self.BioText.text = objects[0]["bio"] as? String
                    self.InterestsText.text = objects[0]["interests"] as? String
                }
            }
        }
        
        
//        FullName.text = "Alex Hales"
//        UniversityName.text = "Purdue University"
//        BioText.text = "I have a cat and 2 dogs. Marvel beats DC... Embarassing childhood stories are the best kind of stories..."
//        InterestsText.text = "Interests: \n- Hiking\n- Coffee\n- Fishing\n- Books\n- Food and Cooking"
            CreateInviteButton.layer.cornerRadius = 5
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
