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
        query.getObjectInBackground(withId: self.objectId){(invite:PFObject?, error:Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else if let invite = invite{
                invite["status"] = true
                invite.saveInBackground()
                print("success")
            }
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    

}
