//
//  CreateInviteViewController.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 4/11/21.
//

import UIKit
import Parse

class CreateInviteViewController: ViewController,UIPickerViewDataSource, UIPickerViewDelegate {

    

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var numberPeoplePicker: UIPickerView!
    var pickNumbers: [Int]!
    var acceptedPick : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberPeoplePicker.delegate = self
        self.numberPeoplePicker.dataSource = self
        
        let min = 1
        let max = 4
        self.pickNumbers = Array( stride(from:min , to:max+1, by:1))
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPostButton(_ sender: Any) {
        let location = locationTextField.text!
        let dateAndTime = dateTimePicker.date
        let notes = notesTextField.text!
        
     
        
        let time = dateAndTime.description.components(separatedBy: " ")[1]

        let invite = PFObject(className: "invites")
        invite["location"] = location
        invite["invite_details"] = notes
        invite["date"] = dateAndTime
        invite["time"] = time
        invite["status"] = false
        invite["userid"] = PFUser.current()!
        invite["accepted"] = self.acceptedPick

        invite.saveInBackground{(success, error) in
            if success {
                self.scheduleLocalNotification()
                self.performSegue(withIdentifier: "inviteComplete", sender: nil)
//                self.successPostingInvite(text: "Invite added to Database!")
                print("saved!")
            }else{
                print("error!")
            }
        }
    }
    
    func successPostingInvite(text:String){
        let alertView = UIAlertController(title: "Success!", message: text, preferredStyle: .alert)
             let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
             }
             alertView.addAction(OKAction)
             if let presenter = alertView.popoverPresentationController {
                 presenter.sourceView = self.view
                 presenter.sourceRect = self.view.bounds
             }
             self.present(alertView, animated: true, completion:nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickNumbers.count
    }
  
   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return "\(pickNumbers[row])"
   }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.acceptedPick = self.pickNumbers[row]
    }
    
    func scheduleLocalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Don't forget to check if your invite has been accepted!"
        content.body = "Click Open to view your invites"
        content.sound = UNNotificationSound.default
            
        // You can use the user info array if you need to include additional information in your local notification.
        // Then you could use that additional information to perform any kind of action when the notification is opened by the user
        content.userInfo = ["CustomData": "You will be able to include any kind of information here"]
        
        let open = UNNotificationAction(identifier: "open", title: "Open", options: .foreground)
        
        let cancel = UNNotificationAction(identifier: "close", title: "Close", options: .destructive)
        
        let categories = UNNotificationCategory(identifier: "action", actions: [open,cancel], intentIdentifiers: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([categories])
        content.categoryIdentifier = "action"
            
        let yourDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
            
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: yourDate.timeIntervalSinceNow, repeats: false)
            
        let request = UNNotificationRequest.init(identifier: "req", content: content, trigger: trigger)
            
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }

}
