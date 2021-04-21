//
//  PreviousInvitesViewController.swift
//  MeetUp
//
//  Created by Ayushman Singh on 4/3/21.
//

import UIKit
import Parse



class PreviousInvitesViewController:  UITableViewController  {
    
    var invitesDictionary = [PFObject]()
    var invite : PFObject!
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //performSegue(withIdentifier: "editPreviousInactiveSegue", sender: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviousInviteCell") as! PreviousInviteCell
        
        let currentInvite = invitesDictionary[indexPath.row]
        
        cell.notesLabel.text = currentInvite["invite_details"] as! String
        
        cell.acceptedLabel.text = String(currentInvite["accepted"] as! Int)
        let inviteDate = currentInvite["date"] as! Date
        
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "E, MMM d, h:mm a"
        cell.dateTimeLabel.text = formatter3.string(from: inviteDate)
        cell.locationLabel.text = currentInvite["location"] as! String
        cell.editButton.layer.cornerRadius = 5
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editPreviousInactiveSegue", sender: self)
    }
    
    @IBAction func onEditButton(_ sender: Any) {
       // self.performSegue(withIdentifier: "editPreviousInactiveSegue", sender: Any?)
    }
    
    @IBOutlet var previousInvitesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.tableView.rowHeight = 200
        let userQuery = PFQuery(className: "invites")
        let statusQuery = PFQuery(className: "invites")
        
        userQuery.whereKey("userid", equalTo:PFUser.current()!)
        statusQuery.whereKey("status", equalTo: true)
        
        let query = PFQuery.orQuery(withSubqueries: [userQuery, statusQuery])
        query.limit = 20
        
        query.findObjectsInBackground { (invites: [PFObject]?, error: Error?) in
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editPreviousInactiveSegue"{
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
