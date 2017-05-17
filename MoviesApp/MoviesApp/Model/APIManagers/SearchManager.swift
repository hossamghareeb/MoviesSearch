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
    
    /// Send api call to search movies with specific query
    func searchMoviesWithQuery(_ query: String, completionHandler: @escaping APICompletionHandler) {
        
        let URL = "\(Constants.searchEndPoint)&query=\(query)"
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire.request(URL).responseArray(keyPath: "results") { (response: DataResponse<[Movie]>) in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
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
