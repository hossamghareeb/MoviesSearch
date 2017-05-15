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
        
        APIManager.shared.searchMoviesWithQuery(query) { [weak self] (result) in
            guard let `self` = self else { return }
            switch result {
            case .success(let moviesResponse):
                if let movies = moviesResponse as? [Movie], movies.isEmpty == false {
                    movies.forEach({ print($0.name) })
                    self.queriesStore.addQuery(query)
                    self.recentQueries = self.queriesStore.recentQueries()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
