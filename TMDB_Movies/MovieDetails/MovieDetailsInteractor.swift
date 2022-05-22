//
//  MovieDetailsInteractor.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 16.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailsBusinessLogic {
    func makeRequest(request: MovieDetails.Request)
}

protocol MovieDetailDataStore {
    var movieId: String { get set }
}

class MovieDetailsInteractor: MovieDetailsBusinessLogic, MovieDetailDataStore {
    
    var movieId: String = ""
    var presenter: MovieDetailsPresentationLogic?
    var service = MoviesNetworkService()
    
    func makeRequest(request: MovieDetails.Request) {
        
        service.fetchMovieDetails(movieid: request.movieId) { movie in
            guard let movie = movie else { return }
            let response = MovieDetails.Response(movie: movie)
            self.presenter?.presentMovieDetails(response: response)
        }
    }
    
}
