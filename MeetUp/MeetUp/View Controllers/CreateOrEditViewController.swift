//
//  CreateOrEditViewController.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 3/28/21.
//

import UIKit

class CreateOrEditViewController: ViewController {

    @IBOutlet weak var postOrSaveText: UIBarButtonItem!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var dateAndTime: UIDatePicker!
    @IBOutlet weak var notesTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func postButton(_ sender: Any) {
    }
    @IBAction func cancelButton(_ sender: Any) {
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
