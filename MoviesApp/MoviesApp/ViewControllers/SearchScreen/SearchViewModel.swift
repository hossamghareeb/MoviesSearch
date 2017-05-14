//
//  SearchViewModel.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/14/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import UIKit

class SearchViewModel {

    private let queriesStore: RecentQueriesStore
    private(set) var recentQueries: [String]
    init() {
        queriesStore = RecentQueriesStore(storageManager: RecentQueriesStorageManager())
        recentQueries = queriesStore.recentQueries()
    }
    
    func searchMoviesWithQuery(_ query: String) {
        queriesStore.addQuery(query)
        recentQueries = queriesStore.recentQueries()
    }
}
