//
//  SearchViewModel.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/14/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import UIKit

protocol SearchViewModelDelegate: class {
    func searchViewModel(_ viewModel: SearchViewModel, gotMoviesViewModel moviesViewModel: MoviesViewModel)
    func searchViewModel(_ viewModel: SearchViewModel, didFailWithError error: Error)
}

class SearchViewModel {

    private let queriesStore: RecentQueriesStore
    private(set) var recentQueries: [String]
    weak var delegate: SearchViewModelDelegate?
    
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
                    self.queriesStore.addQuery(query)
                    self.recentQueries = self.queriesStore.recentQueries()
                    let moviesViewModel = MoviesViewModel(movies: movies, searchQuery: query)
                    self.delegate?.searchViewModel(self, gotMoviesViewModel: moviesViewModel)
                } else {
                    self.delegate?.searchViewModel(self, didFailWithError: NSError(domain: "MoviesApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "No movies found with such query"]))
                }
            case .failure(let error):
                self.delegate?.searchViewModel(self, didFailWithError: error)
            }
        }
    }
    
    func searchWithQueryAtIndex(_ index: Int) {
        searchMoviesWithQuery(recentQueries[index])
    }
}
