//
//  MoviesFeedViewController.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Kingfisher

/*
 HOME WORK
 
 1. Fix coments +
 2. Create Detail Screen ( image, title) - imageVIew + TextField + Button +
 3. Move between 2 VC +-
 4. 2 VC -  move data -> edit data -> on 1 VC data changed ( если нажать на кнопку - возвращаемся на первый экран)
 
 PS. При изменении данных на втором экране - на первом должно поменятся.
 */

protocol MoviesFeedDisplayLogic: AnyObject {
    func displayData(viewModel: MoviesFeed.ViewModel.ViewModelData)
}

class MoviesFeedViewController: UIViewController {
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    var interactor: MoviesFeedBusinessLogic?
    var router: (MoviesFeedRoutingLogic & MovieListDataPassing)?
    
    var movies: [MovieModel] = []
    var selectedIndex: Int?
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = MoviesFeedInteractor()
        let presenter = MoviesFeedPresenter()
        let router = MoviesFeedRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        moviesTableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        fetchAllMovies()
    }
    
    private func fetchAllMovies() {
        let request = MoviesFeed.Request()
        interactor?.fetchAllMovies(request: request)
    }
}

// MARK: TableView Methods
extension MoviesFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.configure(movie: movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movieId = movies[indexPath.row].id
        print("Movie pressed: \(movies[indexPath.row].title) / id: \(movieId)")
        
        router?.routeToDetails(movie: movies[indexPath.row])
        
        print("------------------")
    }
}

// MARK: Display logic
extension MoviesFeedViewController: MoviesFeedDisplayLogic {
    func displayData(viewModel: MoviesFeed.ViewModel.ViewModelData) {
        
        switch viewModel {
        case let .displayMoviesFeed(data):
            movies = data
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
        }
    }
}
