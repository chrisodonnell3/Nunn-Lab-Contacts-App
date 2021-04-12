//
//  contactsTableViewController.swift
//  NunnLabContacts
//
//  Created by Chris O'Donnell on 3/25/21.
//

import UIKit
var resultSearchController = UISearchController()
let tableData = ["One","Two","Three","Twenty-One"]
var filteredTableData = [String]()

class contactsTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // added some code for the search bar
//        resultSearchController = ({
//            let controller = UISearchController(searchResultsController: nil)
//            controller.searchResultsUpdater = self
//            controller.obscuresBackgroundDuringPresentation = false
//            controller.searchBar.sizeToFit()
//            tableView.tableHeaderView = controller.searchBar
//            return controller
//        })()
//        // Reload the table
//        tableView.reloadData()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if  (resultSearchController.isActive) {
//              return 1
//          } else {
//              return 3
//          }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myContactCell", for: indexPath) as!
            individualTableViewCell

        // Configure the cell...
        
        cell.ContactName.text = "Zion Williamson"
        cell.ContactPhoto.image = UIImage(named: "ProfileTest")

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as! detailContactViewController
        let selectRow = tableView.indexPathForSelectedRow?.row
        
        // assign elements of destVC using index selectRow with each data array
        
        
    }
    

}
