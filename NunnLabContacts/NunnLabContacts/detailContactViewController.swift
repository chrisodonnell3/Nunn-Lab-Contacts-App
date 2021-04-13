//
//  detailContactViewController.swift
//  NunnLabContacts
//
//  Created by Chris O'Donnell on 3/25/21.
//  Description: More detailed info of a contact. Will display: all names, photo, sex/gender, age, and potentially references to other contacts.
//

import UIKit

class detailContactViewController: UIViewController {
    
    // TODO: Evelyn's work
    // Connected elements
    // Need to connect these to the TableViewCell Controller tomorrow
    @IBOutlet weak var contactPicture: UIImageView!
    
    @IBOutlet weak var contactName: UILabel!
    
    @IBOutlet weak var contactSex: UILabel!
    
    @IBOutlet weak var contactAge: UILabel!
    
    @IBOutlet weak var contactLocation: UILabel!
    
    var contact_name: String = ""
    var contact_sex: String = ""
    var contact_age : String = ""
    var contact_location : String = ""
    var picture: UIImage!
    
    // Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        contactName.text = contact_name
        contactSex.text = contact_sex
        contactAge.text = contact_age
        contactLocation.text = contact_location
        contactPicture.image = picture

        // Do any additional setup after loading the view.
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
