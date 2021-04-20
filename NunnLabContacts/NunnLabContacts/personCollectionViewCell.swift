//
//  personCollectionViewCell.swift
//  NunnLabContacts
//
//  Created by Chris O'Donnell on 4/12/21.
//

import UIKit

class personCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var contactPhoto: UIImageView!
    
    @IBOutlet weak var contactNames: UILabel!
    
    @IBOutlet weak var contactID: UILabel!
    
    // Aesthetic for cell
    override func layoutSubviews() {
        
        // Circular profile picture in cell
        contactPhoto.layer.borderWidth = 1
        contactPhoto.layer.masksToBounds = false
        contactPhoto.layer.borderColor = UIColor.clear.cgColor
        //contactPhoto.layer.cornerRadius = contactPhoto.frame.height/2
        contactPhoto.clipsToBounds = true
        
        // Modify the layout of the cell
        //self.layer.cornerRadius = 16.0
        self.layer.borderWidth = 5.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
    
        //self.contentView.layer.cornerRadius = 15.0
        self.contentView.layer.borderWidth = 5.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.systemBackground.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        self.layer.shadowRadius = 3.5
        self.layer.shadowOpacity = 0.6
        //self.layer.cornerRadius = 15.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    
    }

}


