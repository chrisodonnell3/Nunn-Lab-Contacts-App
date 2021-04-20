//
//  updateContactViewController.swift
//  NunnLabContacts
//
//  Created by codeplus on 4/11/21.
//
// I think this is completed.

import UIKit

class updateContactViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Declaration of contents
    // Was trying to do pre-populated text but that failed :( (Maybe I will continue tomorrow)
    @IBOutlet weak var ucontactNames: UITextField!
    @IBOutlet weak var ucontactSex: UITextField!
    @IBOutlet weak var ucontactLocation: UITextField!
    @IBOutlet weak var ucontactAlias: UITextField!
    @IBOutlet weak var ucontactDOB: UITextField!
    @IBOutlet weak var usubmitButton: UIButton!
    
    var ualiasArray = [String]()
    var unameStr: String?
    var usexStr: String?
    var ulocationStr: String?
    var ualiasStr: String?
    var uDOBStr: String?
    var uimageData: Data?
    var ucontact: Contact? // this object needs to be passed from landing view controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usubmitButton.layer.cornerRadius = 10.0
        ucontactNames.text = unameStr
        ucontactSex.text = usexStr
        ucontactDOB.text = uDOBStr
        ucontactLocation.text = ulocationStr
        ucontactAlias.text = ualiasStr
    }
    
    @IBAction func updateContact(_ sender: Any) {
        // Initializing values
        unameStr = ucontactNames.text!.trimmingCharacters(in: .whitespaces)
        usexStr = ucontactSex.text
        ulocationStr = ucontactLocation.text
        ualiasStr = ucontactAlias.text
        uDOBStr = ucontactDOB.text

        // If values don't change, make it nil
//        if (ucontact?.name == unameStr) {
//            // we make value null
//            unameStr = nil
//        }
//        if (ucontact?.sex == usexStr) {
//            usexStr = nil
//        }
//        if (ucontact?.location == ulocationStr) {
//            ulocationStr = nil
//        }
//        if (ucontact?.birthdate == uDOBStr) {
//            uDOBStr = nil
//        }
//        if (ucontact?.picture == uimageData) {
//            uimageData = nil
//        } // We are going to skip the alias check lol
//
//        // Code continued
//        if ualiasStr != nil && ualiasStr!.count != 0 {
//            ualiasArray = ualiasStr!.components(separatedBy: ", ")
//        }
//        // Not too positive on how to do Alias check before breaking everything
//        if (ucontact?.aliases == ualiasArray) {
//            ualiasArray.removeAll()
//        }
//
//
//        if unameStr!.count != 0 {
//            PersistenceManager.shared.updateContact(contact: ucontact!, name: unameStr, aliases: ualiasArray, birthdate: uDOBStr, sex: usexStr, location: ulocationStr, picture: uimageData)
//            usubmitButton.setTitle("Updated!", for: .normal)
//            ucontactNames.layer.borderWidth = 0
//        } else {
//            ucontactNames.layer.borderWidth = 1
//            ucontactNames.layer.borderColor = UIColor.red.cgColor
//        }
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
    
    
//     Need to prepopulate
//
//     Need function for updating
    

    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */

}
