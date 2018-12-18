//
//  DataBaseService.swift
//  RealmPractic
//
//  Created by Anton Samonin on 11/18/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation
import RealmSwift

class DataBaseService {
    
    static var configuration : Realm.Configuration {
        return Realm.Configuration( deleteRealmIfMigrationNeeded: true)
    }
    
    
    @discardableResult
    static func saveToRealm<Element: Object>(items: [Element], config: Realm.Configuration = Realm.Configuration.defaultConfiguration, update: Bool = true ) -> Realm? {
       
        do{
        let realm = try Realm(configuration: config)
            print(realm.configuration.fileURL ?? "")
            try realm.write {
                realm.add(items, update: update)
            }
            return realm
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    static func getObjectsFromRealm<Element: Object>(_ itemType: Element.Type, config: Realm.Configuration = Realm.Configuration.defaultConfiguration) -> Results<Element>?  {
        do {
            let realm = try Realm(configuration: config)
            return realm.objects(itemType)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
