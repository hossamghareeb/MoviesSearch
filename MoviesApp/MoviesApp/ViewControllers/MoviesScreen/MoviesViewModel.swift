//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/15/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import UIKit

class MoviesViewModel {

    private var viewModels = [MovieCellViewModel]()
    private let searchQuery: String
    private var movies: [Movie]
    
    init(movies: [Movie], searchQuery: String) {
        self.movies = movies
        self.searchQuery = searchQuery
        prepareViewModelsForMovies()
    }
    
    private func prepareViewModelsForMovies() {
        // Sort to display the latest released first
        let sortedMovies = movies.sorted(by: { $0.releaseDate > $1.releaseDate })
        viewModels = sortedMovies.map({ MovieCellViewModel(movie: $0) })
    }
    
    var moviesCount: Int {
        return viewModels.count
    }
    
    func viewModelForMovieAtIndex(_ index: Int) -> MovieCellViewModel {
        return viewModels[index]
    }
    
    var title: String {
        return searchQuery
    }
    
    func refreshListOfMovies(_ handler: @escaping (_ error: Error?) -> ()) {
        APIManager.shared.searchMoviesWithQuery(searchQuery) { [weak self] (result) in
            guard let `self` = self else { return }
            switch result {
            case .success(let moviesResponse):
                if let movies = moviesResponse as? [Movie], movies.isEmpty == false {
                    self.movies = movies
                    self.prepareViewModelsForMovies()
                }
                handler(nil)
            case .failure(let error):
                handler(error)
            }
        }
    }
}
