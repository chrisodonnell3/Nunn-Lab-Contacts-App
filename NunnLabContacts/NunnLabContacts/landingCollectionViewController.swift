//
//  landingCollectionViewController.swift
//  NunnLabContacts
//
//  Created by Chris O'Donnell on 4/12/21.
//  Implemented Search by Ada Wong on 4/18/21.

import UIKit
import CoreData

let searchController = UISearchController(searchResultsController: nil)
let tableData = ["One","Two","Three","Twenty-One"]
var filteredTableData = [String]()

struct Person {
    public var birthdate: String?
    public var sex: String?
    public var names: [String]?
    public var location: String?
    public var picture: Data?
    public var id: String?
}

extension landingCollectionViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    //text of inputted search
    let input = searchController.searchBar.text
    var current = [String]()
    filteredList = []
    for item in self.contactsList{
        let aliases = item.names ?? []
        let ids = item.id ?? ""
        for name in aliases {
            if(name.lowercased().contains(input!.lowercased()) || ids.lowercased().contains(input!.lowercased())) {
        //if that contact’s names array contains the query, add it to the filtered array
                current.append(item.id ?? "")
                self.filteredList.append(item)
                break
            }
        }
    }
    
    
       
    print(current)
    
    if(input!.isEmpty) {
        self.filteredList = self.contactsList
    }
    
    //return the filtered array
    self.collectionView.reloadData()
  }
}

class landingCollectionViewController: UICollectionViewController {
    
//    var contactsList: [Contact] = PersistenceManager.shared.getContacts()
    //Testing
    
    var contactsList = [
        Person(birthdate: "23-12-1999", sex: "Female", names: ["Ada","Adds"], location: "Durham", picture: nil, id: "1"),
        Person(birthdate: "23-12-1999", sex: "Female", names: ["Dante","Inferno"], location: "Durham", picture: nil, id: "2"),
        Person(birthdate: "23-12-1999", sex: "Female", names: ["Billy","Bo"], location: "Durham", picture: nil, id: "3")
    ]
//    var filteredList: [Contact] = PersistenceManager.shared.getContacts()
    
    var filteredList = [
        Person(birthdate: "23-12-1999", sex: "Female", names: ["Ada","Adds"], location: "Durham", picture: nil, id: "1"),
        Person(birthdate: "23-12-1999", sex: "Female", names: ["Dante","Inferno"], location: "Durham", picture: nil, id: "2"),
        Person(birthdate: "23-12-1999", sex: "Female", names: ["Billy","Bo"], location: "Durham", picture: nil, id: "3")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        

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
          
          switch kind {
          case UICollectionView.elementKindSectionHeader:
            
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
            // Need to populate data with CoreData Framework
            let destVC = segue.destination as! detailContactViewController
            let index = collectionView.indexPathsForSelectedItems?.first
            
            // Set default data in case of nil errors
            let defaultPicture = UIImage(named: "DefaultProfile")
            let cellPicture = filteredList[index!.row].picture ?? defaultPicture?.pngData()
            
            // Populate data for detail VC
           
            let namesString = filteredList[index!.row].names!.joined(separator: ", ")
           
            // Combine name with aliases' array and pipe into string
            destVC.contact_name = "Name(s): " + namesString
           
            // Index the rest of contact's information
            destVC.contact_sex = "Sex: " + filteredList[index!.row].sex!
            destVC.picture = UIImage(data: cellPicture!)
            destVC.contact_age = "Age: " + String(getAge(birthdate: filteredList[index!.row].birthdate!))
            destVC.contact_location = "Location: " + filteredList[index!.row].location!
            destVC.contact_id = "ID: " + filteredList[index!.row].id!
            
            // Preparing for next segue
            // destVC.contact = contactsList[index!.row]
            destVC.cname = namesString
            destVC.cid = filteredList[index!.row].id!
            destVC.clocation = filteredList[index!.row].location!
            destVC.csex = filteredList[index!.row].sex!
            destVC.cage = filteredList[index!.row].birthdate!
            destVC.cphoto = cellPicture
            
        }
        
        if segue.identifier == "editProfileSegue" {
            // Okay I need to send the contact info
            
            
            let destVC = segue.destination as! updateContactViewController
            let index = collectionView.indexPathsForSelectedItems?.first
            
            // Default picture in case of nil error
            let defaultPicture = UIImage(named: "DefaultProfile")
            let cellPicture = filteredList[index!.row].picture ?? defaultPicture?.pngData()

            destVC.unameStr = filteredList[index!.row].names!.joined(separator: ", ")
            destVC.usexStr = filteredList[index!.row].sex!
            destVC.uimageData = cellPicture
            destVC.uDOBStr = String(getAge(birthdate: filteredList[index!.row].birthdate!))
            destVC.ulocationStr = filteredList[index!.row].location!
            
        }
    }
    
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filteredList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
                
        if let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? personCollectionViewCell {
    
            let defaultPicture = UIImage(named: "DefaultProfile")
            let cellPicture = filteredList[indexPath.row].picture ?? defaultPicture?.pngData()
            customCell.contactPhoto.image = UIImage(data: cellPicture!)
            
        
            // Retrive name and aliases for specific contact
            let namesString = filteredList[indexPath.row].names!.joined(separator: ", ")
            
            customCell.contactNames.text = namesString
            customCell.contactID.text = filteredList[indexPath.row].id
             
            cell = customCell
        
        }
        
        return cell
    }

    func getAge(birthdate: String) -> Int{
            // Retrieves age of contact from specified birth date
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "dd-MM-yyyy"
            
            let baseDate = dateFormatter.date(from: "00-00-0000")
            
            let date = dateFormatter.date(from: birthdate)
        let age = Calendar.current.dateComponents([.year], from: ((date ?? baseDate)!), to: Date()).year ?? 0
            return age
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

