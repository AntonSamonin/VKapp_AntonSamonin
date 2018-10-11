//
//  Group.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 10/9/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation
import UIKit

class Group  {
    var name: String
    var groupAvatar: UIImage
    
    init(name: String, groupAvatar: UIImage ) {
        self.name = name
        self.groupAvatar = groupAvatar
    }
    
}

struct GroupsBase {
    var elements = [Group]()
    
    mutating func push(_ group: Group){
        elements.append(group)
    }
    
    mutating func pop(index: Int) -> Group? {
        guard index >= 0 && index < elements.count else {return nil}
        return elements[index]
    }
}
