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
 2. Create Detail Screen ( image, title) - imageVIew + TextField + Button
 3. Move between 2 VC
 4. 2 VC -  move data -> edit data -> on 1 VC data changed ( если нажать на кнопку - возвращаемся на первый экран)
 
 PS. При изменении данных на втором экране - на первом должно поменятся.
 */

protocol MoviesFeedDisplayLogic: AnyObject {
    func displayData(viewModel: MoviesFeed.Model.ViewModel.ViewModelData)
}

class MoviesFeedViewController: UIViewController, MoviesFeedDisplayLogic {
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    var interactor: MoviesFeedBusinessLogic?
    var router: MoviesFeedRoutingLogic?
    
    var movies: [MovieModel] = []
    
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
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != nil else { return }
        guard router != nil else { return }
        let sender = sender as! [String: Any]
        //        router.routeToMovieDetailsVC(segue: segue, movieId: sender["movieId"] as! String)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        setup()
        fetchAllMovies()
        
    }
    
    private func fetchAllMovies() {
        let request = MoviesFeed.Model.Request()
        interactor?.fetchAllMovies(request: request)
    }
    
    
    func displayData(viewModel: MoviesFeed.Model.ViewModel.ViewModelData) {
        
        switch viewModel {
        case let .displayMoviesFeed(data):
            movies = data
            moviesTableView.reloadData()
        }
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
//        performSegue(withIdentifier: "goToDetails", sender: ["movieId": movieId])
        
        guard let detailsVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController else { return }
        present(detailsVC, animated: true)
//        navigationController?.pushViewController(detailsVC, animated: true)
        
        print("------------------")
        
        print("Movie pressed: \(movies[indexPath.row].title) / id: \(movieId)")
        
        detailsVC.movieLabelTextField?.text = movies[indexPath.row].title
        print("Movie in details VC: \(detailsVC.movieLabelTextField?.text ?? "")")
        print("------------------")
        
        detailsVC.moviePosterImageView.kf.setImage(with: URL(string: movies[indexPath.row].poster))
    }
}
