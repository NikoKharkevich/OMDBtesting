//
//  MoviesFeedInteractor.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MoviesFeedBusinessLogic {
    func makeRequest(request: MoviesFeed.Model.Request.RequestType)
}

class MoviesFeedInteractor: MoviesFeedBusinessLogic {
    
    var presenter: MoviesFeedPresentationLogic?
    var service: MoviesFeedService?
    
    func makeRequest(request: MoviesFeed.Model.Request.RequestType) {
        if service == nil {
            service = MoviesFeedService()
        }
        
        switch request {
            
        case .some:
            print("some interactor")
        case .getFeed:
            print("getFeed interactor")
            
            presenter?.presentData(response: .presentMoviesFeed)
        }
        
    }
    
}
