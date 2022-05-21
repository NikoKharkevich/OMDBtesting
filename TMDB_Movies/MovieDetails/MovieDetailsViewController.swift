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
    func displayData(viewModel: MovieDetails.Model.ViewModel.ViewModelData)
}

protocol TextFieldMovieDetailsDelegate: AnyObject {
    func textChanged(text: String?)
}

class MovieDetailsViewController: UIViewController, MovieDetailsDisplayLogic {
    
    var interactor: MovieDetailsBusinessLogic?
    var router: (MovieDetailsRoutingLogic & MovieDetailDataPassing)?
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieLabelTextField: UITextField!
    
    @IBAction func changeTextButton(_ sender: UIButton) {
        print(movieLabelTextField.text ?? "")
        textDelegate?.textChanged(text: movieLabelTextField.text)
    }
    
    weak var textDelegate: TextFieldMovieDetailsDelegate?
    var text: String? = nil
    
    
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
    
    func displayData(viewModel: MovieDetails.Model.ViewModel.ViewModelData) {
        
    }
 
}
