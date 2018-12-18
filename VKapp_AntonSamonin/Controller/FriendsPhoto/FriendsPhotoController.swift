//
//  FriendsPhotoController.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 25.09.2018.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit
import RealmSwift

class FriendsPhotoController: UICollectionViewController {
    
    private let vkService = VKService()
    private var photos: Results<Photo>?
    var ownerID: Int?
    private var users: Results<User>?
    private var notificationToken: NotificationToken?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vkService.loadUserAllPhotosAlamofire(ownerID: ownerID ?? Session.instance.userId) { [weak self] (photos, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let photos = photos, let self = self, let realm = DataBaseService.saveToRealm(items: photos, config: DataBaseService.configuration, update: true)
                else {return}
            
            if let ownerID = self.ownerID {
                
                do {
                    self.photos = realm.objects(Photo.self).filter("ownerID == \(ownerID)")
                    
                    guard  let user = realm.object(ofType: User.self, forPrimaryKey: ownerID) else {return}
                    do {
                        try realm.write {
                            user.photos.append(objectsIn: photos)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
                
            }
            self.collectionView?.reloadData()
        }
        
    }
      
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pairCollectionAndRealm()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationToken?.invalidate()
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showPicture" {
//            if let cell = sender as? UICollectionViewCell,
//                let indexPath = self.collectionView?.indexPath(for: cell) {
//            let openPhotoController = segue.destination as! OpenPhoto
////            openPhotoController.friendPhoto = UIImage(named: friendPhotos[indexPath.row])
//
//        }
//    }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? FriendsPhotoCell, let photos = photos else {return UICollectionViewCell()}
        
       cell.configure(with: photos[indexPath.row])
        
        


        // Configure the cell
    
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showPicture",
            let cell = sender as? UICollectionViewCell,
            let indexPath = self.collectionView.indexPath(for: cell),
            let destinationVC = segue.destination as? OpenPhoto,
            let photos = photos
            else {return}
        destinationVC.friendPhoto = photos[indexPath.row].photo
    }
    
    func pairCollectionAndRealm() {
        self.notificationToken = photos?.observe{ [weak self] (changes) in
            guard let collectionView = self?.collectionView else {return}
            switch changes {
                
            case .initial(_):
                collectionView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                collectionView.performBatchUpdates({
                    collectionView.insertItems(at: insertions.map({ IndexPath(row: $0, section: 0)}))
                    collectionView.deleteItems(at: deletions.map({ IndexPath(row: $0, section: 0)}))
                    collectionView.reloadItems(at: modifications.map({ IndexPath(row: $0, section: 0)}))
                }, completion: nil)
            case .error(let error):
                fatalError("\(error)")
            }
        }
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
