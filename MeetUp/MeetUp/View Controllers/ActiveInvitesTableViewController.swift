//
//  ActiveInvitesTableViewController.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 4/18/21.
//

import UIKit
import Parse

class ActiveInvitesTableViewController: UITableViewController {

    var invitesDictionary = [PFObject]()
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousInviteCell") as! PreviousInviteCell
        
        let currentInvite = invitesDictionary[indexPath.row]
        
        cell.notesLabel.text = currentInvite["invite_details"] as! String
        
        cell.acceptedLabel.text = "2"
        let inviteDate = currentInvite["date"] as! Date
        
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "E, MMM d, h:mm a"
        cell.dateTimeLabel.text = formatter3.string(from: inviteDate)
        cell.locationLabel.text = currentInvite["location"] as! String
        cell.editButton.layer.cornerRadius = 5
        return cell
    }
    
 
    @IBOutlet var previousInvitesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.tableView.rowHeight = 200
        let query = PFQuery(className: "invites")
        
        query.whereKey("userid", equalTo:PFUser.current()!)
        query.whereKey("status", equalTo: false)
        query.limit = 20
        
        query.findObjectsInBackground { (invites, error) in
            if invites != nil {
                self.invitesDictionary = invites!
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return invitesDictionary.count
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editPreviousActiveSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editPreviousActiveSegue"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let invite = invitesDictionary[indexPath.row]
                let editInviteViewController = segue.destination as! EditInviteViewController
                editInviteViewController.invite = invite
            }
        }
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
