//
//  MoviesViewController.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/14/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    var viewModel: MoviesViewModel!
    private var refreshControl: UIRefreshControl?
    
    @IBOutlet private weak var moviesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        moviesTableView.rowHeight = UITableViewAutomaticDimension
        moviesTableView.estimatedRowHeight = 90
        title = viewModel.title
        
        setupPullToRefresh()
    }
    
    private func setupPullToRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        moviesTableView.refreshControl = refreshControl
    }
    
    @objc private func refresh() {
        refreshControl?.beginRefreshing()
        viewModel.refreshListOfMovies { [weak self] (error) in
            guard let `self` = self else { return }
            self.refreshControl?.endRefreshing()
            if let error = error {
                print(error)
            } else {
                self.moviesTableView.reloadData()
            }
        }
    }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        cell.bindViewModel(viewModle: viewModel.viewModelForMovieAtIndex(indexPath.row))
        return cell
    }
}
