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
            var title: String
            var year: String
            var poster: String
            var id: String

            init(data: MovieModel) {
                self.title = data.title
                self.poster = data.poster
                self.year = data.year
                self.id = data.id
            }
        }
        var displayedMovie: DisplayedMovie
    }
}
