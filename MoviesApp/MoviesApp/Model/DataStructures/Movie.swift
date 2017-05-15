//
//  Movie.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/15/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import ObjectMapper

class Movie: Mappable {
    
    let posterPath: String
    let name: String
    let releaseDate: Date
    let overview: String

    required init?(map: Map) {
        do {
            posterPath = try map.value("poster_path")
            name = try map.value("title")
            releaseDate = try map.value("release_date", using: DateTransform(format: "yyyy-MM-dd"))
            overview = try map.value("overview")
        } catch {
            return nil
        }
    }
    
    func mapping(map: Map) {
    }
}
