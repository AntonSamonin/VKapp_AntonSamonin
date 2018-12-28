//
//  MyGroupsController.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 25.09.2018.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit
import RealmSwift
class MyGroupsController: UITableViewController, UISearchBarDelegate {
    private var vkService = VKService()
    private var myGroups: Results<Group>?
    private var notificationToken: NotificationToken?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vkService.loadUserGroupsAlamofire {  (myGroups, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let myGroups = myGroups else {return}
            
            DispatchQueue.global(qos: .utility).async {
                DataBaseService.saveToRealm(items: myGroups, config: DataBaseService.configuration, update: true)
            }
        }
        
        searchBar.delegate = self
        
        self.myGroups = DataBaseService.getObjectsFromRealm(Group.self, config: DataBaseService.configuration)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.notificationToken = myGroups?.observe{ [weak self] (changes) in
            
            guard let self = self else{return}
            
            switch changes {
                
            case .initial(_):
                self.tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                self.tableView.applyChanges(deletions: deletions, insertions: insertions, updates: modifications)
            case .error(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.notificationToken?.invalidate()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myGroups?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsCell", for: indexPath) as? MyGroupsCell, let myGroups = myGroups else {return UITableViewCell()}
        
        cell.configure(with: myGroups[indexPath.row])
        
        
        // Configure the cell...
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    
    
    
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //        guard !searchText.isEmpty else {
    //
    //            tableView.reloadData()
    //            return
    //        }
    //
    //        }
    //
    //    }
    
    
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
