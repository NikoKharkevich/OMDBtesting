//
//  MoviesFeedInteractor.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MoviesFeedBusinessLogic {
    func fetchAllMovies(request: MoviesFeed.Model.Request)
}

class MoviesFeedInteractor: MoviesFeedBusinessLogic {
    
    var presenter: MoviesFeedPresentationLogic?
    var service = MoviesNetworkService()
    
    func fetchAllMovies(request: MoviesFeed.Model.Request) {
        
        service.fetchMoviesData(completion: { data in
            guard let data = data else { return }
            print("MoviesFeedInteractor called")
            self.presenter?.presentData(response: .presentMoviesFeed(data))
        })
    }
}


