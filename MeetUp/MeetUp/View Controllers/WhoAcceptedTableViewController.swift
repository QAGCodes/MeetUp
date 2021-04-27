//
//  WhoAcceptedTableViewController.swift
//  MeetUp
//
//  Created by csuser on 4/27/21.
//

import UIKit
import Parse

class WhoAcceptedTableViewController: UITableViewController {
    
    var invite : PFObject!
    var profiles = [PFObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getProfiles()
        sleep(1)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func getProfiles() {
        if invite["acceptProfiles"] == nil {
            return
        }
        
        let profileIDs = invite["acceptProfiles"] as! [String]
        
        let query = PFQuery(className: "Profile")
        query.includeKey("user")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) profiles.")
                // Do something with the found objects
                if objects.count > 0 {
                    for object in objects {
                        let user = object["user"] as! PFUser
                        let userID = user.objectId!
                        if let index = profileIDs.firstIndex(of: userID) {
                            self.profiles.append(object)
                            print(self.profiles)
                        }
                        
                        
                    }
                }
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
        return profiles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WhoAcceptedTableViewCell", for: indexPath) as! WhoAcceptedTableViewCell
        let profile = profiles[indexPath.row]
        
        cell.accepterName.text = profile["dispname"] as! String
        cell.accepterBio.text = profile["bio"] as! String
        cell.accepterInterests.text = profile["interests"] as! String
        
        let imageFile = profile["picture"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        cell.accepterImage.af_setImage(withURL: url)
        
        cell.accepterImage.layer.masksToBounds = false
        cell.accepterImage.layer.cornerRadius = cell.accepterImage.frame.height/2
        cell.accepterImage.clipsToBounds = true
        
        

        // Configure the cell...

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
