//
//  InvitesTableViewCell.swift
//  MeetUp
//
//  Created by csuser on 4/8/21.
//

import UIKit

class InvitesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var inviterImage: UIImageView!
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
