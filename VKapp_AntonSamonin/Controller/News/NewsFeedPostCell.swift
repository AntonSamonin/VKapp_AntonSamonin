//
//  NewsFeedPostCell.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 12/18/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit
import Kingfisher

class NewsFeedPostCell: UITableViewCell {

    @IBOutlet weak var authorAvatar: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var textPostView: UITextView!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var repostsCountLabel: UILabel!
    @IBOutlet weak var viewsCountLabel: UILabel!
    @IBOutlet weak var attachPicture: UIImageView!
    
    
    
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
    
    func configure(post: Post, groups: [NewsGroup], profiles: [NewsProfile]) {
        guard let posttext = post.postText, let postComments = post.comments, let postLikes = post.likes, let postReposts = post.reposts else {return}
        self.textPostView.text = posttext
        self.textPostView.isEditable = false
        self.likesCountLabel.text = String(postLikes)
        self.commentsCountLabel.text = String(postComments)
        self.repostsCountLabel.text = String(postReposts)
        self.viewsCountLabel.text = String(0)
       
        if let attachPhoto = post.attachments?.first?.photo {
        self.attachPicture.kf.setImage(with: VKService.urlForAvatar(attachPhoto))
        }
        
       
        if post.sourceId < 0 {
            for group in groups where post.sourceId + group.id == 0 {
                self.authorAvatar.kf.setImage(with: VKService.urlForAvatar(group.avatar))
                self.authorLabel.text = group.name
            }
        }
        else if post.sourceId > 0 {
            for profile in profiles where post.sourceId - profile.id == 0 {
                self.authorAvatar.kf.setImage(with: VKService.urlForAvatar(profile.avatar))
                self.authorLabel.text = profile.firstName + " " + profile.lastName
            }
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorAvatar.image = nil
        self.authorLabel.text = nil
        self.textPostView.text = nil
        self.likesCountLabel.text = nil
        self.commentsCountLabel.text = nil
        self.repostsCountLabel.text = nil
        self.viewsCountLabel.text = nil
    }
    
}
