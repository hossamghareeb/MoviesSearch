//
//  RecentQueriesStorageManager.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/14/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import Foundation

class RecentQueriesStorageManager: StoreMapManagerProtocol {
    
    let defaults = UserDefaults.standard
    
    func saveObject(_ object: Any?, forKey key: StoreMap.Keys) {
        defaults.set(object, forKey: key.rawValue)
    }
    func loadObjectForKey(_ key: StoreMap.Keys) -> Any? {
        return defaults.value(forKey: key.rawValue)
    }
    func removeObjectForKey(_ key: StoreMap.Keys) {
        defaults.set(nil, forKey: key.rawValue)
    }
}
