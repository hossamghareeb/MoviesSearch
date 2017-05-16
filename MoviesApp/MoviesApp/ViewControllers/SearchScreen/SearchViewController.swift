//
//  SearchViewController.swift
//  MoviesApp
//
//  Created by Hossam Ghareeb on 5/14/17.
//  Copyright © 2017 Hossam Ghareeb. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet private weak var moviesSearchBar: UISearchBar!
    @IBOutlet fileprivate weak var recentQueriesTableView: UITableView!
    
    fileprivate let viewModel = SearchViewModel()
    
    fileprivate var shouldShowRecentQueries = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesSearchBar.delegate = self
        recentQueriesTableView.dataSource = self
        recentQueriesTableView.delegate = self
        viewModel.delegate = self
    }
}

// MARK: - UISearchBarDelegate -

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        
        shouldShowRecentQueries = true
        recentQueriesTableView.reloadData()
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // User clicked on search button
        if let text = searchBar.text, text.characters.count > 0 {
            viewModel.searchMoviesWithQuery(text)
        }
    }
}

// MARK: - UITableViewDataSource -

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shouldShowRecentQueries ? viewModel.recentQueries.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        precondition(cell != nil, "Couldn't create cell with identinfier: cell")
        cell!.textLabel?.text = viewModel.recentQueries[indexPath.row]
        return cell!
    }
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.searchWithQueryAtIndex(indexPath.row)
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func searchViewModel(_ viewModel: SearchViewModel, gotMovies movies: [Movie], forSearchQuery query: String) {
        
        if let moviesViewController = storyboard?.instantiateViewController(withIdentifier: "MoviesViewController") as? MoviesViewController {
            let moviesViewModel = MoviesViewModel(movies: movies, searchQuery: query)
            moviesViewController.viewModel = moviesViewModel
            show(moviesViewController, sender: self)
        }
        
    }
}
