//
//  MovieCellViewModel.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/15/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import UIKit

class MovieCellViewModel {

    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var movieName: String {
        return movie.name
    }
    
    var movieOverview: String {
        return movie.overview
    }
    
    var posterURLString: String {
        return PosterSize.w92.posterURLStringForPath(movie.posterPath)
    }
    
    var releasedDateString: String {
        let formatter = Formatters.shared
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: movie.releaseDate)
    }
}
