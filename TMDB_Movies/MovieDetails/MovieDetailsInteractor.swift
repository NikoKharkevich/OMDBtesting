//
//  MovieDetailsInteractor.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 16.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailsBusinessLogic {
    func getMovieDetails(request: MovieDetails.Request)
}

protocol MovieDetailDataStore {
    var movie: MovieDetails.ViewModel.DisplayedMovie? { get set }
}

class MovieDetailsInteractor: MovieDetailsBusinessLogic, MovieDetailDataStore {

    var movie: MovieDetails.ViewModel.DisplayedMovie?
    var presenter: MovieDetailsPresentationLogic?
    var service = MoviesNetworkService()
    
    func getMovieDetails(request: MovieDetails.Request) {
        
        service.fetchMovieDetails(movieid: request.movieId) { movie in
            guard let movie = movie else { return }
            let response = MovieDetails.Response(movie: movie)
            self.presenter?.presentMovieDetails(response: response)
        }
    }
    
}
