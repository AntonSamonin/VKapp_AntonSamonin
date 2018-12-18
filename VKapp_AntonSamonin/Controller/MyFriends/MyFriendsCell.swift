//
//  MyFriendsCell.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 25.09.2018.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit
import Kingfisher

class MyFriendsCell: UITableViewCell {
    @IBOutlet weak var friendsAva: UIImageView! 
    @IBOutlet weak var friendsName: UILabel! {
        didSet {self.friendsName.textColor = UIColor.black }
    }
    
    override func layoutIfNeeded() { // Закругление
        super .layoutIfNeeded()
        self.friendsAva.clipsToBounds = true
        self.friendsAva.layer.cornerRadius = self.friendsAva.frame.width/2
    }
    
    public func configure(with friend: User) {
  
        self.friendsName.text = friend.firstName + " " + friend.lastName
        self.friendsAva.kf.setImage(with: VKService.urlForAvatar(friend.avatar))
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.friendsAva.image = nil
        self.friendsName.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
