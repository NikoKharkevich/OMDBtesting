//
//  MovieDetailsRouter.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 16.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MovieDetailsRoutingLogic {
    
}

protocol MovieDetailDataPassing {
    var dataStore: MovieDetailDataStore? { get }
}

class MovieDetailsRouter: MovieDetailsRoutingLogic, MovieDetailDataPassing {
    
    var dataStore: MovieDetailDataStore?
    weak var viewController: MovieDetailsViewController?
    
}
