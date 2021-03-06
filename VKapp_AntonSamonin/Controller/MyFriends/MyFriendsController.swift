//
//  TableViewController.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 25.09.2018.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit
import RealmSwift

class MyFriendsController: UITableViewController, UISearchBarDelegate {
    
    private let vkService = VKService()
    //    private var friends = [User]()
    private var friends: Results<User>?
    private var notificationToken: NotificationToken?
    @IBOutlet weak var searchBar: UISearchBar!
    
    //    var friends1 = [Friend]()
    //    var friendsToShow = [Friend]()
    
    //    var friendPhotos: UIImage?
    //
    //    var letters = [Character]()
    
    //    var friendsNames = ["Артем","Костя", "Вика", "Александр", "Марат"]
    //    var friendsSurname = ["Мирочник","Суслин","Бобровская","Кречетов","Эльдаров"]
    //    var avatarNames = ["Артем","Костя","Вика","Александр","Марат"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        for count in 0...(friendsNames.count-1) {
        //            let newAvatar = UIImage(named: avatarNames[count])
        //            let friend = Friend(name: friendsNames[count], surname: friendsSurname[count], avatar: newAvatar!)
        //               friends.append(friend)
        //        }
        //        friendsToShow = friends1
        //        createLettersArray()
        searchBar.delegate = self
        
        vkService.loadUserFriendsAlamofire {  (friends, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let friends = friends else  {return}
            
            DispatchQueue.global(qos: .utility).async {
                DataBaseService.saveToRealm(items: friends, config: DataBaseService.configuration, update: true)
            }
        }
        self.friends = DataBaseService.getObjectsFromRealm(User.self, config: DataBaseService.configuration)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.notificationToken = friends?.observe { [weak self] changes in
            guard let self = self else {return}
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
        notificationToken?.invalidate()
    }
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //
    //        return String(letters[section])
    ////    }
    //    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 20
    //    }
    
    // MARK: - Table view data source
    // Метод в котором мы обязаны вернуть количество секций в таблице.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //метод, ккоторый возвращает количество строк в секции.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //     var numberOfRows = 0
        //        for i in friendsToShow {
        //            if i.surname.first == letters[section] {
        //                numberOfRows += 1
        //            }
        //
        //        }
        return friends?.count ?? 0
    }
    
    
    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? MyFriendsCell,
            let friends = friends else {return UITableViewCell()}
        cell.configure(with: friends[indexPath.row])
        
        //        for i in friendsToShow {
        //            if i.surname.first == letters[indexPath.section] {
        //                cell.friendsName.text = i.name + " " + i.surname
        //                cell.friendsAva.image = i.avatar
        //            }
        //        }
        
        return cell
    }
    
    
    //    func createLettersArray() {
    //        var localLetters = Set<Character>()
    //        for i in friendsToShow {
    //            localLetters.insert(i.surname.first!)
    //        }
    //        letters = localLetters.sorted()
    //    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            //            friendsToShow = friends
            tableView.reloadData()
            return
        }
        //        friendsToShow = friendsToShow.filter{
        //            $0.name.lowercased().contains(searchText.lowercased()) || $0.surname.lowercased().contains(searchText.lowercased())
    }
    //            tableView.reloadData()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Show friends photos",
            let destinationVC = segue.destination as? FriendsPhotoController,
            let indexPath = tableView.indexPathForSelectedRow
            else { return }
        if let friends = friends {
            destinationVC.ownerID = friends[indexPath.row].id
        }
    }
    
    
    
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


