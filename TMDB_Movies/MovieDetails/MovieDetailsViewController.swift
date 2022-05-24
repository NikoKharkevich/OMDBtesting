//
//  MovieDetailsViewController.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 16.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Kingfisher

protocol MovieDetailsDisplayLogic: AnyObject {
    func displayMovieDetail(viewModel: MovieDetails.ViewModel)
}

class MovieDetailsViewController: UIViewController {
    
    var interactor: MovieDetailsBusinessLogic?
    var router: (MovieDetailsRoutingLogic & MovieDetailDataPassing)?
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieLabelTextField: UITextField!
    
    @IBAction func changeTextButton(_ sender: UIButton) {
        print(movieLabelTextField.text ?? "")
        changeTextField()
        navigationController?.popViewController(animated: true)
    }
    
    private func changeTextField() {

    }
 
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = MovieDetailsInteractor()
        let presenter = MovieDetailsPresenter()
        let router = MovieDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    // MARK: Routing

    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchMovieDetails()
    }
    
    // MARK: Do business logic
    private func fetchMovieDetails() {
        
        guard let router = router,
              let dataStore = router.dataStore else { return }
        let request = MovieDetails.Request(movieId: dataStore.movieId)
        interactor?.getMovieDetails(request: request)
        
    }
}

// MARK: Display logic
extension MovieDetailsViewController: MovieDetailsDisplayLogic {
    func displayMovieDetail(viewModel: MovieDetails.ViewModel) {
        
        let movie = viewModel.displayedMovie
        
        DispatchQueue.main.async {
            self.movieLabelTextField.text = movie.title
            self.moviePosterImageView?.kf.setImage(with: URL(string: movie.poster))
        }
    }
}
