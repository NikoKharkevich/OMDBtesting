//
//  MovieDetailsModels.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 16.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum MovieDetails {
    
    struct Request {
        var movieId: String
    }
    
    struct Response {
        var movie: MovieModel?
    }
    
    struct ViewModel {
        struct DisplayedMovie {
            let title: String
            let year: String
            let poster: String
            let id: String
        }
        var displayedMovie: DisplayedMovie
    }
}
