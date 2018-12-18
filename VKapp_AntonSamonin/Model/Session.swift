//
//  Session.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 10/31/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation

class Session {
    static let instance = Session()
    private init(){}
    
    var token: String = ""
    var userId = Int()
}
