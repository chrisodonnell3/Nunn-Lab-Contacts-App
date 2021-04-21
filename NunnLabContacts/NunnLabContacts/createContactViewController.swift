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
    

    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var sex: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var alias: UITextField!
    @IBOutlet weak var birthday: UITextField!
    @IBOutlet weak var submit: UIButton!
    var idStr: String = ""
    var namesArray = [String]()
    var namesStr: String = ""
    var sexStr: String?
    var locationStr: String?
    var birthdayStr: String?
    var imageData: Data?
    
    var readytoCreate: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submit.layer.cornerRadius = 10.0
        
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
        
        birthdayStr = birthdateErrorCheck(birthdate: birthday.text!)
        
        
        if readytoCreate{
            idStr = id.text!.trimmingCharacters(in: .whitespaces)
            namesStr = name.text!.trimmingCharacters(in: .whitespaces)
            sexStr = sex.text
            locationStr = location.text
            
            if namesStr.count != 0 {
                namesArray = namesStr.components(separatedBy: ", ")
            }
            if namesStr.count != 0 && idStr.count != 0 {
                PersistenceManager.shared.insertContact(id: idStr, names: namesArray, birthdate: birthdayStr, sex: sexStr, location: locationStr, picture: imageData)
                submit.setTitle("Success!", for: .normal)
                name.layer.borderWidth = 0
            } else {
                name.layer.borderWidth = 1
                name.layer.borderColor = UIColor.red.cgColor
                id.layer.borderWidth = 1
                id.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
        
    
    
    func birthdateErrorCheck(birthdate: String) -> String{
        
        if  birthdate.count > 9{
            let r = birthdate.index(birthdate.startIndex, offsetBy: 3)..<birthdate.index(birthdate.endIndex, offsetBy: -5)
            
            let month = Int(birthdate[r])!
            
            if (month > 12){
                let alert = UIAlertController(title: "Birthdate Input Error", message: "Please enter a valid birthdate of format dd-MM-yyyy", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                readytoCreate = false
                } else{
                    readytoCreate = true
                    return birthdate
        }
        
        }
        return ""
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
