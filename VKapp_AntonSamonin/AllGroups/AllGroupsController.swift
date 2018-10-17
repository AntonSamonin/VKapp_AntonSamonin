//
//  AllGroupsController.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 25.09.2018.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit

class AllGroupsController: UITableViewController, UISearchBarDelegate  {
  
    @IBOutlet weak var searchBarAllGroups: UISearchBar!
    
    var groups = [Group]()
    var groupsToShow = [Group]()
    
    
    var groupsNames = ["GeekBrains","BOOM","KudaGo","Большая Деревня","Netflix"]
    var groupsAva = ["GeekBrains","BOOM","KudaGo","Большая Деревня","Netflix"]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        for count in 0...(groupsNames.count-1) {
            let newAvatar = UIImage(named: groupsAva[count])
            let group = Group(name: groupsNames[count], groupAvatar: newAvatar!)
            groups.append(group)
            
        }
        groupsToShow = groups
        searchBarAllGroups.delegate = self
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
        // #warning Incomplete implementation, return the number of rows
        return groupsToShow.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsCell
        let group = groupsToShow[indexPath.row]
        cell.allGroupsName.text = group.name
        cell.allGroupsAva.image = group.groupAvatar
      
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            groupsToShow = groups
            tableView.reloadData()
            return
        }
        groupsToShow = groupsToShow.filter{
            $0.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
