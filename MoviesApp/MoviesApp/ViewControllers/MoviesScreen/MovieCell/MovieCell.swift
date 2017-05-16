//
//  MovieCell.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/15/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {

    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var releasedDateLabel: UILabel!
    
    func bindViewModel(viewModle: MovieCellViewModel) {
        if let url = URL(string: viewModle.posterURLString) {
            posterImageView.sd_setImage(with: url)
        }
        movieNameLabel.text = viewModle.movieName
        releasedDateLabel.text = viewModle.releasedDateString
        overviewLabel.text = viewModle.movieOverview
    }
}
