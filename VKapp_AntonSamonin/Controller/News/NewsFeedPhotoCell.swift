//
//  NewsFeedPhotoCell.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 12/18/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit

class NewsFeedPhotoCell: UITableViewCell {

    @IBOutlet weak var photoAuthorAvatar: UIImageView!
    @IBOutlet weak var photoAuthorLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var repostsCountLabel: UILabel!
    @IBOutlet weak var viewsCountLabel: UILabel!
    
    override func layoutSubviews() { // Закругление
        super .layoutSubviews()
        self.photoAuthorAvatar.clipsToBounds = true
        self.photoAuthorAvatar.layer.cornerRadius = self.photoAuthorAvatar.frame.width/2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoAuthorAvatar.image = nil
        self.photoView.image = nil
        self.photoAuthorLabel.text = nil
        self.likesCountLabel.text = nil
        self.commentsCountLabel.text = nil
        self.repostsCountLabel.text = nil
        self.viewsCountLabel.text = nil
      
    }
    
    func configure(post: Post, postPhoto: PostPhoto, groups: [NewsGroup], profiles: [NewsProfile]) {
        self.likesCountLabel.text = String(postPhoto.likes)
        self.commentsCountLabel.text = String(postPhoto.comments)
        self.repostsCountLabel.text = String(postPhoto.reposts)
        self.viewsCountLabel.text = String(0)
        self.photoView.kf.setImage(with: VKService.urlForAvatar(postPhoto.photo))
        
        if postPhoto.ownerId < 0 {
            for group in groups where postPhoto.ownerId + group.id == 0 {
                self.photoAuthorAvatar.kf.setImage(with: VKService.urlForAvatar(group.avatar))
                self.photoAuthorLabel.text = group.name
            }
        }
        else if postPhoto.ownerId > 0 {
            for profile in profiles where postPhoto.ownerId - profile.id == 0 {
                self.photoAuthorAvatar.kf.setImage(with: VKService.urlForAvatar(profile.avatar))
                self.photoAuthorLabel.text = profile.firstName + " " + profile.lastName
            }
        }
        
    }
    
}
