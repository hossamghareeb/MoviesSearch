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

/// a protocol to be conformed by any store manager that saves data with key-value
protocol StoreMapManagerProtocol: class {
    func saveObject(_ object: Any?, forKey key: StoreMap.Keys)
    func loadObjectForKey(_ key: StoreMap.Keys) -> Any?
    func removeObjectForKey(_ key: StoreMap.Keys)
}

/// A base class for any store that stores information with key-value
class BaseStoreMap {
    let storageManager: StoreMapManagerProtocol
    init(storageManager: StoreMapManagerProtocol) {
        self.storageManager = storageManager
    }
}
