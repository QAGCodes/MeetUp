//
//  CreateProfileViewController.swift
//  MeetUp
//
//  Created by Vipata Kilembo on 4/20/21.
//

import UIKit
import Parse
import AlamofireImage

class CreateProfileViewController: ViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var displayNameField: UITextField!
    @IBOutlet weak var collegeField: UITextField!
    @IBOutlet weak var majorField: UITextField!
    @IBOutlet weak var bioField: UITextField!
    @IBOutlet weak var interestsField: UITextField!
    @IBOutlet weak var profilePictureField: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = PFUser.current()!
        let firstName = user["firstname"] as! String
        let lastName = user["lastname"] as! String
        fullnameLabel.text = firstName + " " + lastName
        displayNameField.text = user["username"] as! String
        
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage

        let size = CGSize(width: 186, height: 186)
        let scaledImage = image.af_imageAspectScaled(toFill: size)

        profilePictureField.image = scaledImage
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onSaveButton(_ sender: Any) {
        let user = PFUser.current()!
        let profile = PFObject(className: "Profile")
        let firstName = user["firstname"] as! String
        let lastName = user["lastname"] as! String
        profile["fullname"] = firstName + " " + lastName
        profile["dispname"] = self.displayNameField.text!
        profile["college"] = self.collegeField.text!
        profile["bio"] = self.bioField.text!
        profile["interests"] = self.interestsField.text!
        profile["major"] = self.majorField.text!
        profile["user"] = user
        let imageData = self.profilePictureField.image?.pngData()
        let file = PFFileObject(data: imageData!)
        profile["picture"] = file
        
        profile.saveInBackground{(success, error) in
            if success {
                self.performSegue(withIdentifier: "toMainFromCreate", sender: self)
                print("saved!")
            }else{
                print("error!")
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
