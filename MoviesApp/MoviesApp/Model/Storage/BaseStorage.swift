//
//  BaseStorage.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/14/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

class StoreMap {
    enum Keys: String {
        case recentSearchQueries
    }
}

protocol StoreMapManagerProtocol: class {
    func saveObject(_ object: Any?, forKey key: StoreMap.Keys)
    func loadObjectForKey(_ key: StoreMap.Keys) -> Any?
    func removeObjectForKey(_ key: StoreMap.Keys)
}

class BaseStoreMap {
    let storageManager: StoreMapManagerProtocol
    init(storageManager: StoreMapManagerProtocol) {
        self.storageManager = storageManager
    }
}
