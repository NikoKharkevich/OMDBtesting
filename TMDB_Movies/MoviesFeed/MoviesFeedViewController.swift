//
//  MoviesFeedViewController.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MoviesFeedDisplayLogic: AnyObject {
    func displayData(viewModel: MoviesFeed.Model.ViewModel.ViewModelData)
}

class MoviesFeedViewController: UIViewController, MoviesFeedDisplayLogic {
    
    @IBOutlet weak var moviesTable: UITableView!
    
    var interactor: MoviesFeedBusinessLogic?
    var router: (NSObjectProtocol & MoviesFeedRoutingLogic)?
    
    var movies: [MovieModel] = []
    var movieManager = MovieManager()
    
    
    // MARK: Setup
    
    private func setup() {
        let viewController        = self
        let interactor            = MoviesFeedInteractor()
        let presenter             = MoviesFeedPresenter()
        let router                = MoviesFeedRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
    
    // MARK: Routing
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTable.register(MovieCell.self, forCellReuseIdentifier: "CustomCell")
        
        setup()
        
        interactor?.makeRequest(request: .getFeed)
        
    }
    
    func displayData(viewModel: MoviesFeed.Model.ViewModel.ViewModelData) {
        
        switch viewModel {
            
        case .some:
            print("some displayData")
        case .displayMoviesFeed:
            
            movieManager.fetchMoviesData { movies in
                print("Call fetcher")
                
                if let decodedMovies = movies {
                    self.movies = decodedMovies
                    self.moviesTable.reloadData()
                    print("Fetcher success")
                    
                } else {
                    print("Fetcher Error")
                }
            }
        }
    }
    
}

extension MoviesFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! MovieCell
        cell.configure(movie: movies[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
