//
//  Constants.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/16/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import UIKit

struct Constants {

    static let posterBaseURLString = "http://image.tmdb.org/t/p/"
    private static let apiKey = "2696829a81b1b5827d515ff121700838"
    private static let baseURL = "http://api.themoviedb.org/3/"
    
    static let searchEndPoint = "\(Constants.baseURL)search/movie?api_key=\(Constants.apiKey)"
}
