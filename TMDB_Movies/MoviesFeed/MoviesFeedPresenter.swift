//
//  MoviesFeedPresenter.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MoviesFeedPresentationLogic {
    func presentData(response: MoviesFeed.Model.Response.ResponseType)
}

class MoviesFeedPresenter: MoviesFeedPresentationLogic {
    weak var viewController: MoviesFeedDisplayLogic?
    
    func presentData(response: MoviesFeed.Model.Response.ResponseType) {
        
        switch response {
            
        case .some:
            print("some presenter")
        case .presentMoviesFeed:
            print("present Movies Feed")
            viewController?.displayData(viewModel: .displayMoviesFeed)
        }
    }
    
}
