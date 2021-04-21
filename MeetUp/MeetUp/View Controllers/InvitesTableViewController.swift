//
//  InvitesTableViewController.swift
//  MeetUp
//
//  Created by csuser on 4/8/21.
//

import UIKit
import Parse

class InvitesTableViewController: UITableViewController {
    
    var invitesDictionary = [PFObject]()
    var currentProfile: PFObject!
    var currentInvite: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let query = PFQuery(className: "invites")
        query.includeKey("userid")
        query.limit = 20
        
        query.findObjectsInBackground { (invites, error) in
            if invites != nil {
                self.invitesDictionary = invites!
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return invitesDictionary.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InvitesTableViewCell", for: indexPath) as! InvitesTableViewCell
        
        cell.acceptButton.layer.cornerRadius = 5
        cell.infoButton.layer.cornerRadius = 5
        
        
        let currentInvite = invitesDictionary[indexPath.row]
        let user = currentInvite["userid"] as! PFUser
        cell.nameLabel.text = user["firstname"] as! String
//TODO  cell.inviterImage =
        cell.descriptionLabel.text = currentInvite["invite_details"] as! String
        cell.locationLabel.text = currentInvite["location"] as! String
        cell.objectId = currentInvite.objectId ?? ""
        let inviteDate = currentInvite["date"] as! Date
        
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "E, MMM d, h:mm a"
        cell.dateTimeLabel.text = formatter3.string(from: inviteDate)
        
        let match = user.objectId as! String
        //print("\(match)")
        let query = PFQuery(className: "Profile")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                //print("Successfully retrieved \(objects.count) profiles.")
                
                for object in objects {
                    let user = object["user"] as! PFUser
                    if (user.objectId == match) {
                        self.currentProfile = object
                    }
                }
                
                // Do something with the found objects
            }
        }
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = sender as! UIButton
        guard let cell = sender.superview?.superview as? InvitesTableViewCell else {
            return // or fatalError() or whatever
        }

        let indexPath = tableView.indexPath(for: cell)
        let invite = invitesDictionary[indexPath!.row]
        
        let invitesDetailsViewController = segue.destination as! InviteDetailsViewController
        
        invitesDetailsViewController.invite = invite
        invitesDetailsViewController.profile = currentProfile
        
    }
    

}
