//
//  InvitesTableViewCell.swift
//  MeetUp
//
//  Created by csuser on 4/8/21.
//

import UIKit
import Parse

class InvitesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var inviterImage: UIImageView!

    
    @IBOutlet weak var acceptButton: UIButton!
    
    @IBOutlet weak var infoButton: UIButton!
    var objectId:String
        = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func onAcceptButton(_ sender: Any) {
        let query = PFQuery(className: "invites")
        if(self.acceptButton.currentTitle == "Accept"){
            print("accepting")
            query.getObjectInBackground(withId: self.objectId){(invite:PFObject?, error:Error?) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let invite = invite{
                    var current = invite["accepted"] as! Int
                    current+=1
                    invite["status"] = true
                    invite["accepted"] = current
                    invite.saveInBackground()
                    print("success")
                    self.acceptButton.setTitle("Cancel", for: .normal)
                }
            }
        }
        else if(self.acceptButton.currentTitle == "Cancel"){
            print("canceling")
            query.getObjectInBackground(withId: self.objectId){(invite:PFObject?, error:Error?) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let invite = invite{
                    var current = invite["accepted"] as! Int
                    current-=1
                    invite["status"] = false
                    invite["accepted"] = current
                    invite.saveInBackground()
                    print("success")
                    self.acceptButton.setTitle("Accept", for: .normal)
                }
            }
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    

}
