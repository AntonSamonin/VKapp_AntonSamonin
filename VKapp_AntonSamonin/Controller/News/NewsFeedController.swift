//
//  NewsFeedController.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 12/18/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit

class NewsFeedController: UITableViewController {
    
    private let vkService = VKService()
    private var newsFeed: [Post]?
    private var groups: [NewsGroup]?
    private var profiles: [NewsProfile]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "NewsFeedPhotoCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
        tableView.register(UINib(nibName: "NewsFeedPostCell", bundle: nil), forCellReuseIdentifier: "PostCell")
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
        vkService.loadNewsFeedPost() { [weak self] (newsFeed, groups, profiles, error)
            in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let newsfeed = newsFeed, let groups = groups, let profiles = profiles, let self = self else {return}
            self.groups = groups
            self.profiles = profiles
            self.newsFeed = newsfeed
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsFeed?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? NewsFeedPostCell,
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as? NewsFeedPhotoCell,
            let newsFeed = newsFeed, let groups = groups, let profiles = profiles  else {return UITableViewCell()}
        
        guard newsFeed[indexPath.row].type == "post" else {
            cell2.configure(post: newsFeed[indexPath.row], postPhoto: newsFeed[indexPath.row].photos![0], groups: groups, profiles: profiles)
            return cell2
        }
        cell1.configure(post: newsFeed[indexPath.row], groups: groups, profiles: profiles)
        return cell1
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
