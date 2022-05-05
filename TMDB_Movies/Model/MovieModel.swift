//
//  MovieModel.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 28.04.2022.
//

import Foundation

struct MovieModel {
    
    let title: String
    let year: String
    let poster: String
    
    init(data: Search) {
        self.title = data.title
        self.poster = data.poster
        self.year = data.year
    }
}
