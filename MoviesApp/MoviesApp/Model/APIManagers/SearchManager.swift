//
//  SearchManager.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/15/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

extension APIManager {

    func searchMoviesWithQuery(_ query: String, completionHandler: @escaping APICompletionHandler) {
        let URL = "http://api.themoviedb.org/3/search/movie?api_key=2696829a81b1b5827d515ff121700838&query=\(query)"
        Alamofire.request(URL).responseArray(keyPath: "results") { (response: DataResponse<[Movie]>) in
            
            switch response.result {
            case .success:
                let movies = response.result.value ?? []
                completionHandler(.success(response: movies))
            case .failure(let error):
                completionHandler(.failure(error: error))
            }
        }
    }
}
