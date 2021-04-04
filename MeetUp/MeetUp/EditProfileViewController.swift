//
//  EditProfileViewController.swift
//  MeetUp
//
//  Created by Ayushman Singh on 4/3/21.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet var fullNameField: UITextField!
    @IBOutlet var dispNameField: UITextField!
    @IBOutlet var collegeField: UITextField!
    @IBOutlet var majorField: UITextField!
    @IBOutlet var bioField: UITextField!
    @IBOutlet var interestsField: UITextField!
    @IBAction func saveButton(_ sender: UIButton) {
        self.dismiss(animated: true) {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
