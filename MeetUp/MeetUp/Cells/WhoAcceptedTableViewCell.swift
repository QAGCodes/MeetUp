//
//  WhoAcceptedTableViewCell.swift
//  MeetUp
//
//  Created by csuser on 4/27/21.
//

import UIKit

class WhoAcceptedTableViewCell: UITableViewCell {

    @IBOutlet weak var accepterImage: UIImageView!
    @IBOutlet weak var accepterName: UILabel!
    @IBOutlet weak var accepterBio: UILabel!
    @IBOutlet weak var accepterInterests: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
