//
//  individualTableViewCell.swift
//  NunnLabContacts
//
//  Created by Chris O'Donnell on 3/25/21.
//

import UIKit

class individualTableViewCell: UITableViewCell {
    

    @IBOutlet weak var ContactName: UILabel!
    
    @IBOutlet weak var ContactPhoto: UIImageView!
    //    @IBOutlet weak var ContactPhoto: UIImageView!
//
//    @IBOutlet weak var ContactName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
