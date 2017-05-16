//
//  MoviesViewModel.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/15/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import UIKit

class MoviesViewModel {

    private let viewModels: [MovieCellViewModel]
    let searchQuery: String
    init(movies: [Movie], searchQuery: String) {
        let sortedMovies = movies.sorted(by: { $0.releaseDate > $1.releaseDate })
        viewModels = sortedMovies.map({ MovieCellViewModel(movie: $0) })
        self.searchQuery = searchQuery
    }
    
    var moviesCount: Int {
        return viewModels.count
    }
    
    func viewModelForMovieAtIndex(_ index: Int) -> MovieCellViewModel {
        return viewModels[index]
    }
}
