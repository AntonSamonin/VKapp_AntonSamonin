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
    
    
    var photos = [UIImage]()
    
    init(name: String, avatar: UIImage) {
        self.name = name
        self.avatar = avatar
        for count in 0...2 {
            if let photo = UIImage(named: name+String(count)) {
                photos.append(photo)
            }
        }
    }
    
}

struct FriendsBase {
    var elements = [Friend]()
    
    mutating func push(friend: Friend) {
        elements.append(friend)
    }
    mutating func pop(_ index: Int) -> Friend? {
        guard index >= 0 && index < elements.count else {return nil}
        return elements[index]
    }
}
