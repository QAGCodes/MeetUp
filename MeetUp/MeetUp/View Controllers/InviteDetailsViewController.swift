//
//  InviteDetailsViewController.swift
//  MeetUp
//
//  Created by csuser on 4/18/21.
//

import UIKit
import Parse

class InviteDetailsViewController: UIViewController {
    
    var invite: PFObject!
    var profile: PFObject!

    @IBOutlet weak var inviterImage: UIImageView!
    @IBOutlet weak var inviteDescription: UILabel!
    @IBOutlet weak var inviterName: UILabel!
    @IBOutlet weak var inviterUniversity: UILabel!
    @IBOutlet weak var inviterStandingAndMajor: UILabel!
    @IBOutlet weak var inviterBio: UILabel!
    @IBOutlet weak var firstInterest: UILabel!
    
    var userid : String = ""
    var inviteId : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //inviterImage.image =
        print(self.invite["invite_details"] as! String)
        let user = invite["userid"] as! PFUser
        inviterName.text = user["firstname"] as! String
        inviterUniversity.text = profile["college"] as! String
        inviterStandingAndMajor.text = profile["major"] as! String
        inviterBio.text = profile["bio"] as! String
        firstInterest.text = profile["interests"] as! String


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
