//
//  AllGroupsCell.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 25.09.2018.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit
import Kingfisher

class AllGroupsCell: UITableViewCell {
    @IBOutlet weak var allGroupsAva: UIImageView! {
        didSet {
            self.allGroupsAva.layer.shadowOffset = .zero
            self.allGroupsAva.layer.shadowOpacity = 0.75
            self.allGroupsAva.layer.shadowRadius = 3
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
    
    func configure(with group: Group) {
        self.allGroupsName.text = group.name
        self.allGroupsAva.kf.setImage(with: VKService.urlForAvatar(group.avatar))
    }

}
