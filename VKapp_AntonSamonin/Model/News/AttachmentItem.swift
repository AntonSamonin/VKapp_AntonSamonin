//
//  Attachments.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 12/27/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation
import SwiftyJSON

class AttachmentItem {
    var type: String
    var photo: String?
    
    init(json: JSON) {
        self.type = json["type"].stringValue
        self.photo = json["photo"]["photo_604"].stringValue
    }
}
