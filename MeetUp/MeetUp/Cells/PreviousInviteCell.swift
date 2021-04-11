//
//  PreviousInviteCell.swift
//  MeetUp
//
//  Created by Ayushman Singh on 4/3/21.
//

import UIKit

class PreviousInviteCell: UITableViewCell {
    @IBOutlet var dateTimeLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var notesLabel: UILabel!
    @IBOutlet var acceptedLabel: UILabel!
    @IBOutlet var editButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
