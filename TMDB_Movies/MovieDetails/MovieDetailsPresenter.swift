//
//  MovieDetailsPresenter.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 16.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailsPresentationLogic {
    func presentData(response: MovieDetails.Model.Response.ResponseType)
}

class MovieDetailsPresenter: MovieDetailsPresentationLogic {
    weak var viewController: MovieDetailsDisplayLogic?
    
    func presentData(response: MovieDetails.Model.Response.ResponseType) {
        
    }
    
}
