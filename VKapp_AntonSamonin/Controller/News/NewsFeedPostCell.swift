//
//  NewsFeedPostCell.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 12/18/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit

class NewsFeedPostCell: UITableViewCell {

    @IBOutlet weak var authorAvatar: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var textPostLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var repostsCountLabel: UILabel!
    @IBOutlet weak var viewsCountLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.authorAvatar.clipsToBounds = true
        self.authorAvatar.layer.cornerRadius = self.authorAvatar.frame.width/2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(post: Post, group: NewsGroup, profile: NewsProfile) {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorAvatar.image = nil
        self.authorLabel.text = nil
        self.textPostLabel.text = nil
        self.likesCountLabel.text = nil
        self.commentsCountLabel.text = nil
        self.repostsCountLabel.text = nil
        self.viewsCountLabel.text = nil
    }
    
}
