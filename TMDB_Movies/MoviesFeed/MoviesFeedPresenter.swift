//
//  MoviesFeedPresenter.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MoviesFeedPresentationLogic {
    func presentData(response: MoviesFeed.Response)
}

class MoviesFeedPresenter: MoviesFeedPresentationLogic {
    weak var viewController: MoviesFeedDisplayLogic?
    
    func presentData(response: MoviesFeed.Response) {
        viewController?.displayData(viewModel: .displayMoviesFeed(response.movies))
    }    
}
