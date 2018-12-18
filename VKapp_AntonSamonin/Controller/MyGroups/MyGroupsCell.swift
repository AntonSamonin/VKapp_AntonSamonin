//
//  MyGroupsCell.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 25.09.2018.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit

class MyGroupsCell: UITableViewCell {
    @IBOutlet weak var myGroupsAva: UIImageView!
    @IBOutlet weak var myGroupsName: UILabel! {
        didSet {
            self.myGroupsName.textColor = UIColor.black
        }
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.myGroupsAva.layer.cornerRadius = self.myGroupsAva.bounds.width/2
        self.myGroupsAva.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myGroupsAva.image = nil
        self.myGroupsName.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(with group: Group) {
        self.myGroupsName.text = group.name
        self.myGroupsAva.kf.setImage(with: VKService.urlForAvatar(group.avatar) )
    }

}
