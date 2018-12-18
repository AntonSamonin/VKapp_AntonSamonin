//
//  FriendsPhotoCell.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 25.09.2018.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit
import Kingfisher

class FriendsPhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var friendsPhoto: UIImageView!
    
    
    public func configure(with photo: Photo) {
        self.friendsPhoto.kf.setImage(with: VKService.urlForAvatar(photo.photo))
    }
}
