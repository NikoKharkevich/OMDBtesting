//
//  MoviesFeedInteractor.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MoviesFeedBusinessLogic {
    func fetchAllMovies(request: MoviesFeed.Request)
}

protocol MovieListDataStore {
    var movies : [MovieModel]? {get}
}

class MoviesFeedInteractor: MoviesFeedBusinessLogic, MovieListDataStore {
    var movies: [MovieModel]?
    var presenter: MoviesFeedPresentationLogic?
    var service = MoviesNetworkService()
    
    func fetchAllMovies(request: MoviesFeed.Request) {
        service.fetchMoviesData { movies in
            guard let movies = movies else { return }
            let response = MoviesFeed.Response(movies: movies)
            self.presenter?.presentData(response: response)
        }
    }
    
}


