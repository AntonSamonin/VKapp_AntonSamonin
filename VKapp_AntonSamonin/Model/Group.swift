//
//  Group.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 11/12/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

@objcMembers
class Group: Object {
  dynamic  var id: Int = 0
  dynamic  var name = ""
   dynamic var avatar = ""
    
   convenience init(json: JSON) {
    self.init()
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.avatar = json["photo_100"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func  indexedProperties() -> [String] {
        return ["name"]
    }
}
