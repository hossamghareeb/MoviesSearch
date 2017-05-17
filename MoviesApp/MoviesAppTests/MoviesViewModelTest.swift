//
//  MoviesViewModelTest.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/16/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import Quick
import Nimble
import ObjectMapper
@testable import MoviesApp


class MoviesViewModelTest: QuickSpec {
    
    let movie1 = Movie(map: Map(mappingType: .fromJSON, JSON:
        ["poster_path": "path",
         "title": "test1",
         "overview": "test",
         "release_date": "1989-06-23"
        ]))
    
    let movie2 = Movie(map: Map(mappingType: .fromJSON, JSON:
        ["poster_path": "path",
         "title": "test2",
         "overview": "test",
         "release_date": "2010-06-23"
        ]))
    
    let movie3 = Movie(map: Map(mappingType: .fromJSON, JSON:
        ["poster_path": "path",
         "title": "test3",
         "overview": "test",
         "release_date": "1999-06-23"
        ]))
    
    override func spec() {
        let viewModel = MoviesViewModel(movies: [movie1!, movie2!, movie3!], searchQuery: "test")
        
        describe("Movies view model when created") {
            it("has correct movies count", closure: { 
                expect(viewModel.moviesCount).to(equal(3))
            })
            
            it("has correct title", closure: {
                expect(viewModel.title).to(equal("test"))
            })
        
            it("sorts the movies properly based on release date", closure: { 
                let movieViewModel1 = viewModel.viewModelForMovieAtIndex(0)
                expect(movieViewModel1.releasedDateString).to(equal("Jun 23, 2010"))
                
                let movieViewModel2 = viewModel.viewModelForMovieAtIndex(1)
                expect(movieViewModel2.releasedDateString).to(equal("Jun 23, 1999"))
                
                let movieViewModel3 = viewModel.viewModelForMovieAtIndex(2)
                expect(movieViewModel3.releasedDateString).to(equal("Jun 23, 1989"))
                
            })
        }
    }
}
