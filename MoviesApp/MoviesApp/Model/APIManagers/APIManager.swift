//
//  APIManager.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/15/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import UIKit

enum APIResult {
    case success(response: Any?)
    case failure(error: Error)
}

typealias APICompletionHandler = (_ result: APIResult) -> ()

class APIManager: NSObject {

    static let shared = APIManager()
    
    override private init() {
    }
}
