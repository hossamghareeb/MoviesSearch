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
        ["poster_path": "/path",
         "title": "test1",
         "overview": "test",
         "release_date": "1989-06-23"
        ]))
    
    let movie2 = Movie(map: Map(mappingType: .fromJSON, JSON:
        ["poster_path": "/path",
         "title": "test2",
         "overview": "test",
         "release_date": "2010-06-23"
        ]))
    
    let movie3 = Movie(map: Map(mappingType: .fromJSON, JSON:
        ["poster_path": "/path",
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
                let movieCellViewModel1 = viewModel.viewModelForMovieAtIndex(0)
                expect(movieCellViewModel1.releasedDateString).to(equal("Jun 23, 2010"))
                
                let movieCellViewModel2 = viewModel.viewModelForMovieAtIndex(1)
                expect(movieCellViewModel2.releasedDateString).to(equal("Jun 23, 1999"))
                
                let movieCellViewModel3 = viewModel.viewModelForMovieAtIndex(2)
                expect(movieCellViewModel3.releasedDateString).to(equal("Jun 23, 1989"))
                
            })
        }
        
        describe("MoviesCellViewModels when created") {
            it("has correct props", closure: {
                let movie = self.movie2! // recent one
                let movieCellViewModel = viewModel.viewModelForMovieAtIndex(0)
                expect(movieCellViewModel.movieName).to(equal(movie.name))
                expect(movieCellViewModel.movieOverview).to(equal(movie.overview))
                expect(movieCellViewModel.posterURLString).to(equal(Constants.posterBaseURLString + "w92" + movie.posterPath))
            })
            
        }
    }
}
