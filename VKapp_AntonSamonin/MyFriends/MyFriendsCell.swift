//
//  MyFriendsCell.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 25.09.2018.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit

class MyFriendsCell: UITableViewCell {
    @IBOutlet weak var friendsAva: UIImageView! {
        didSet {
            self.friendsAva.layer.borderColor = UIColor.orange.cgColor
            self.friendsAva.layer.borderWidth = 2
        }
    }
    @IBOutlet weak var friendsName: UILabel! {
        didSet {self.friendsName.textColor = UIColor.black }
    }
    
    override func layoutIfNeeded() { // Закругление
        super .layoutIfNeeded()
        self.friendsAva.clipsToBounds = true
        self.friendsAva.layer.cornerRadius = self.friendsAva.frame.width/2
    }
    
    func configure(avatar: UIImage, name: String) {
    self.friendsAva.image = avatar
    self.friendsName.text = name
        
        self.backgroundColor = UIColor.black
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
