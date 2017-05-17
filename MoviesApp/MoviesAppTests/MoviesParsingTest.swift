//
//  MoviesParsingTest.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/17/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import Quick
import Nimble
import ObjectMapper
@testable import MoviesApp

class MoviesParsingTest: QuickSpec {

    override func spec() {
        let jsonStr1 = "{\"poster_path\":\"/kBf3g9crrADGMc2AMAMlLBgSm2h.jpg\",\"overview\":\"The Dark Knight of Gotham City.\",\"release_date\":\"1989-06-23\",\"title\":\"Batman\"}"

        let jsonStr2 = "{\"posterpath\":\"/kBf3g9crrADGMc2AMAMlLBgSm2h.jpg\",\"overview\":\"The Dark Knight of Gotham City.\",\"release_date\":\"2010-12-23\",\"titless\":\"Batman2\"}"
        let json1 = try! JSONSerialization.jsonObject(with: jsonStr1.data(using: .utf8)!, options: .allowFragments) as! [String: Any]
        
        let json2 = try! JSONSerialization.jsonObject(with: jsonStr2.data(using: .utf8)!, options: .allowFragments) as! [String: Any]
        
        let movie = Movie(map: Map(mappingType: .fromJSON, JSON: json1))
        let invalidMovie = Movie(map: Map(mappingType: .fromJSON, JSON: json2))
        
        describe("Parsing Movies") { 
            it("should create Movie objects from JSON", closure: {
                expect(movie).toNot(beNil())
            })
            
            it("parses properties correctly", closure: {
                if let movie = movie {
                    expect(movie.name).to(equal("Batman"))
                    expect(movie.posterPath).to(equal("/kBf3g9crrADGMc2AMAMlLBgSm2h.jpg"))
                    let formatter = Formatters.shared
                    formatter.dateFormat = "yyyy-MM-dd"
                    expect(formatter.string(from: movie.releaseDate)).to(equal("1989-06-23"))
                }
            })
            
            it("fails if JSON is not valid", closure: { 
                expect(invalidMovie).to(beNil())
            })
        }
    }
}
