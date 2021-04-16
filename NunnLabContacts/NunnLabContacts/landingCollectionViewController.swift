//
//  landingCollectionViewController.swift
//  NunnLabContacts
//
//  Created by Chris O'Donnell on 4/12/21.
//

import UIKit

var resultSearchController = UISearchController()
let tableData = ["One","Two","Three","Twenty-One"]
var filteredTableData = [String]()
var zionImage : UIImage = UIImage(named:"ProfileTest")!

class landingCollectionViewController: UICollectionViewController {
    
    let contactPhotos: [UIImage] = [UIImage(named: "ProfileTest")!]
    let contactNames: [String] = ["Zion Williamson, Zion, The Goat"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        //Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    // Function for the header/search bar in the Collection View
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
          // 1
          switch kind {
          // 2
          case UICollectionView.elementKindSectionHeader:
            // 3
            guard
              let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "headerCollection",
                for: indexPath) as? headerCollectionReusableView
              else {
                fatalError("Invalid view type")
            }

            return headerView
          default:
            // 4
            assert(false, "Invalid element type")
          }
        }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "createSegue"{
            // Populate any items before segue to the create a contact page. Likely no/not much data here, but just in case.
        }
        
        if segue.identifier == "detailSegue"{
            let destVC = segue.destination as! detailContactViewController
            //let index = collectionView.indexPathsForSelectedItems?.first
            
            // Populate data for detail VC 
            destVC.contact_name = "Name(s): " + "Zion Williamson" // after plus will go data
            destVC.contact_sex = "Sex: " + "Male" // after plus will go data
            destVC.picture = zionImage
            destVC.contact_age = "Age: " + "20" // after plus will go data
            destVC.contact_location = "Location: " + "Duke" // after plus will go data
        }
    }
    
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return contactPhotos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? personCollectionViewCell {
    
            customCell.contactPhoto.image = contactPhotos[indexPath.row]
            customCell.contactNames.text = contactNames[indexPath.row]
             
            cell = customCell
        
        }
        
        return cell
    }

    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
