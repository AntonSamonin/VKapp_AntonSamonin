//
//  OpenPhoto.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 10/22/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit
import Kingfisher
class OpenPhoto: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    
 var friendPhoto = ""
  
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.kf.setImage(with: VKService.urlForAvatar(friendPhoto))
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
