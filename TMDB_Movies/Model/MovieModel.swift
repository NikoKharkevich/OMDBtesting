//
//  MovieModel.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 28.04.2022.
//

import Foundation

struct MovieModel {
    
    var title: String
    let year: String
    let poster: String
    let id: String
    
    init(data: Search) {
        self.title = data.title
        self.poster = data.poster
        self.year = data.year
        self.id = data.id
    }
}
