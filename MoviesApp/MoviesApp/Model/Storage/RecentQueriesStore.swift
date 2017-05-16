//
//  RecentQueriesStore.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/14/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import Foundation

class RecentQueriesStore: BaseStoreMap {
    
    let maximumResults = 10
    
    private let key = StoreMap.Keys.recentSearchQueries
    
    func addQuery(_ query: String) {
        var recent = recentQueries()
        recent = recent.filter({ $0 != query })
        recent.insert(query, at: 0) // Recent at the top
        if recent.count > maximumResults {
            recent.removeLast(recent.count - maximumResults)
        }
        storageManager.saveObject(recent, forKey: key)
    }
    
    func removeAllQueries() {
        storageManager.removeObjectForKey(key)
    }
    
    func recentQueries() -> [String] {
        return (storageManager.loadObjectForKey(key) as? [String]) ?? []
    }
}
