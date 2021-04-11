//
//  UserProfileViewController.swift
//  MeetUp
//
//  Created by Ayushman Singh on 4/3/21.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var ProfilePicture: UIImageView!
    @IBOutlet weak var FullName: UILabel!
    @IBOutlet weak var UniversityName: UILabel!
    @IBOutlet weak var YearMajor: UILabel!
    @IBOutlet weak var BioText: UILabel!
    @IBOutlet weak var InterestsText: UILabel!
    @IBOutlet weak var CreateInviteButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FullName.text = "Alex Hales"
        UniversityName.text = "Purdue University"
        BioText.text = "I have a cat and 2 dogs. Marvel beats DC... Embarassing childhood stories are the best kind of stories..."
        InterestsText.text = "Interests: \n- Hiking\n- Coffee\n- Fishing\n- Books\n- Food and Cooking"
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
