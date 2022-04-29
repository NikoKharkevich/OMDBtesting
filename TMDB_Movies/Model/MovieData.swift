//
//  MovieData.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 26.04.2022.
//

import UIKit

struct MovieData: Decodable {
    
    let title: String
    let year: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
    }
}
