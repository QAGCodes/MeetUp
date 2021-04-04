//
//  PreviousInvitesViewController.swift
//  MeetUp
//
//  Created by Ayushman Singh on 4/3/21.
//

import UIKit

class PreviousInvitesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousInviteCell") as! PreviousInviteCell
        cell.notesLabel.text = "Notes:\nBurrito time anyone?"
        cell.acceptedLabel.text = "Accepted Invites: 3"
        cell.dateTimeLabel.text = "Monday, April 21 2021 at 1:00 pm"
        cell.locationLabel.text = "Chipotle, WL"
        cell.editButton.layer.cornerRadius = 5
        return cell
    }
    
 
    @IBOutlet var previousInvitesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        previousInvitesTable.dataSource = self
        previousInvitesTable.delegate = self
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
