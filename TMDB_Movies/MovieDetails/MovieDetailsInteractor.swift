//
//  MovieDetailsInteractor.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 16.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailsBusinessLogic {
    func makeRequest(request: MovieDetails.Model.Request.RequestType)
}

protocol MovieDetailDataStore {
    var movieId: String { get set }
}

class MovieDetailsInteractor: MovieDetailsBusinessLogic, MovieDetailDataStore {
   
    var movieId: String = ""
    var presenter: MovieDetailsPresentationLogic?
    var service: MovieDetailsService?
    
    func makeRequest(request: MovieDetails.Model.Request.RequestType) {
        if service == nil {
            service = MovieDetailsService()
        }
    }
    
}
