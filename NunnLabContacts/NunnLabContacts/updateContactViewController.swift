//
//  updateContactViewController.swift
//  NunnLabContacts
//
//  Created by codeplus on 4/11/21.
//
// COMPLETED

import UIKit

class updateContactViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Declaration of contents
    @IBOutlet weak var ucontactNames: UITextField!
    @IBOutlet weak var ucontactSex: UITextField!
    @IBOutlet weak var ucontactLocation: UITextField!
    @IBOutlet weak var ucontactID: UITextField!
    @IBOutlet weak var ucontactDOB: UITextField!
    @IBOutlet weak var usubmitButton: UIButton!
    
    var unameStr: String = ""
    var namesArray = [String]()
    var usexStr: String?
    var ulocationStr: String?
    var uIDStr: String = ""
    var uDOBStr: String?
    var uimageData: Data?
    var ucontact: Contact?
    
    var readyToUpdate: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usubmitButton.layer.cornerRadius = 10.0
        ucontactNames.text = unameStr
        ucontactSex.text = usexStr
        ucontactDOB.text = uDOBStr
        ucontactLocation.text = ulocationStr
        ucontactID.text = uIDStr
    }
    
    @IBAction func updateContact(_ sender: Any) {
     
        uDOBStr = birthdateErrorCheck(birthdate: ucontactDOB.text!)
        
        if readyToUpdate{
            
            uIDStr = ucontactID.text!.trimmingCharacters(in: .whitespaces)
            unameStr = ucontactNames.text!.trimmingCharacters(in: .whitespaces)
            usexStr = ucontactSex.text
            ulocationStr = ucontactLocation.text
            if unameStr.count != 0 {
                namesArray = unameStr.components(separatedBy: ", ")
            }
            if unameStr.count != 0 && uIDStr.count != 0 {
                PersistenceManager.shared.updateContact(contact: ucontact!, id: uIDStr, names: namesArray, birthdate: uDOBStr, sex: usexStr, location: ulocationStr, picture: uimageData)
                usubmitButton.setTitle("Updated!", for: .normal)
                ucontactNames.layer.borderWidth = 0
            } else {
                ucontactNames.layer.borderWidth = 1
                ucontactNames.layer.borderColor = UIColor.red.cgColor
                ucontactID.layer.borderWidth = 1
                ucontactID.layer.borderColor = UIColor.red.cgColor
            }
        }
        // Declaring variables
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        picker.dismiss(animated: true, completion: nil)
        uimageData = image.pngData()
    }

    @IBAction func updateContactImage(_ sender: Any) {
        let imagePickerControlller = UIImagePickerController()
        imagePickerControlller.delegate = self
        imagePickerControlller.sourceType = .photoLibrary
        self.present(imagePickerControlller, animated: true, completion: nil)
    }


    @IBAction func takePicture(_ sender: Any) {
        let imagePickerControlller = UIImagePickerController()
        imagePickerControlller.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerControlller.sourceType = .camera;
            self.present(imagePickerControlller, animated: true, completion: nil)
        } else {
            print("Camera not available")
        }

    }
    
    
    func birthdateErrorCheck(birthdate: String) -> String{
        let r = birthdate.index(birthdate.startIndex, offsetBy: 3)..<birthdate.index(birthdate.endIndex, offsetBy: -5)
        
        let month = Int(birthdate[r])!
        
        if (month > 12){
            let alert = UIAlertController(title: "Birthdate Input Error", message: "Please enter a valid birthdate of format dd-MM-yyyy", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            readyToUpdate = false
            } else{
                readyToUpdate = true
                return birthdate
        }
        return ""
    }
    
    
}
