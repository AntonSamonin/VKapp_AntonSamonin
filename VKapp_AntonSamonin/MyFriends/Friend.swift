//
//  Friend.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 10/9/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation
import UIKit

class Friend {
    var name: String
    var avatar: UIImage
    var surname: String
    
    
    var photos = [UIImage]()
    
    init(name: String, surname: String, avatar: UIImage) {
        self.name = name
        self.avatar = avatar
        self.surname = surname
       
    }
    
}


