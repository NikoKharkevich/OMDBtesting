//
//  MovieDetailsPresenter.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 16.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailsPresentationLogic {
    func presentMovieDetails(response: MovieDetails.Response)
}

class MovieDetailsPresenter: MovieDetailsPresentationLogic {
    weak var viewController: MovieDetailsDisplayLogic?
    
    func presentMovieDetails(response: MovieDetails.Response) {
        
        guard let movie = response.movie else { return }
        let displayedMovie = MovieDetails.ViewModel.DisplayedMovie.init(data: movie)
        let viewModel = MovieDetails.ViewModel(displayedMovie: displayedMovie)
        
        viewController?.displayMovieDetail(viewModel: viewModel)
    }
    
}
