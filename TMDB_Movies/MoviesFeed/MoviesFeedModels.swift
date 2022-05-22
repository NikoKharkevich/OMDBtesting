//
//  MoviesFeedModels.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum MoviesFeed {
    
    struct Request {
    }
    
    struct Response {
        var movies: [MovieModel]
    }
    
    struct ViewModel {
        enum ViewModelData {
            case displayMoviesFeed([MovieModel])
        }
    }
    
}
