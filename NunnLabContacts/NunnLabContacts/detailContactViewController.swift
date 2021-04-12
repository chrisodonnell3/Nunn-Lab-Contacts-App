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
