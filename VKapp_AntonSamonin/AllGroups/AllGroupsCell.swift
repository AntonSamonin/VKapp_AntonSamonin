//
//  AllGroupsCell.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 25.09.2018.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit

class AllGroupsCell: UITableViewCell {
    @IBOutlet weak var allGroupsAva: UIImageView! {
        didSet {
            self.allGroupsAva.layer.borderColor = UIColor.black.cgColor
            self.allGroupsAva.layer.borderWidth = 2
        }
    }
    @IBOutlet weak var allGroupsName: UILabel! {
        didSet {
            self.allGroupsName.textColor = UIColor.black
        }
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.allGroupsAva.clipsToBounds = true
        self.allGroupsAva.layer.cornerRadius = self.allGroupsAva.frame.width/2
    }
    
    func configure(groupName: String, groupAvatar: UIImage) {
        self.allGroupsAva.image = groupAvatar
        self.allGroupsName.text = groupName
        self.backgroundColor = UIColor.black
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.allGroupsAva.image = nil
        self.allGroupsName.text = nil
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
