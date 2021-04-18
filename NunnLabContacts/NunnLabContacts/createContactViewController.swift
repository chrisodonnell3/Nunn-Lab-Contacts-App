//
//  createContactViewController.swift
//  NunnLabContacts
//
//  Created by Chris O'Donnell on 3/25/21.
//  Description: Will be the segue VC of a button that allows user to
//               create a new data entry contact. Elements: names (primary and aliases),
//               photo, sex/gender, age, general notes, and (potentially) references
//               to other data entries (contacts) mentioned in the interview. 
//

import UIKit

class createContactViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var sex: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var alias: UITextField!
    @IBOutlet weak var birthday: UITextField!
    @IBOutlet weak var submit: UIButton!
    var aliasArray = [String]()
    var nameStr: String = ""
    var sexStr: String?
    var locationStr: String?
    var aliasStr: String?
    var birthdayStr: String?
    var imageData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func uploadPhoto(_ sender: Any) {
        let imagePickerControlller = UIImagePickerController()
        imagePickerControlller.delegate = self
        imagePickerControlller.sourceType = .photoLibrary
        self.present(imagePickerControlller, animated: true, completion: nil)

    }
    @IBAction func takePhoto(_ sender: Any) {
        let imagePickerControlller = UIImagePickerController()
        imagePickerControlller.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerControlller.sourceType = .camera;
            self.present(imagePickerControlller, animated: true, completion: nil)
        } else {
            print("Camera not available")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        picker.dismiss(animated: true, completion: nil)
        imageData = image.pngData()
    }

    @IBAction func createContact(_ sender: Any) {
        nameStr = name.text!.trimmingCharacters(in: .whitespaces)
        sexStr = sex.text
        locationStr = location.text
        aliasStr = alias.text
        birthdayStr = birthday.text
        if aliasStr != nil && aliasStr!.count != 0 {
            aliasArray = aliasStr!.components(separatedBy: ", ")
        }
        if nameStr.count != 0 {
            PersistenceManager.shared.insertContact(name: nameStr, aliases: aliasArray, birthdate: birthdayStr, sex: sexStr, location: locationStr, picture: imageData)
            submit.setTitle("Success!", for: .normal)
            name.layer.borderWidth = 0
        } else {
            name.layer.borderWidth = 1
            name.layer.borderColor = UIColor.red.cgColor
        }
    }
    /*s
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
