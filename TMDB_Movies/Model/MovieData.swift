//
//  MovieData.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 26.04.2022.
//

import UIKit

// MARK: - MovieData
struct MovieData: Codable {
    let search: [Search]

    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

// MARK: - Search
struct Search: Codable {
    let title, year: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
    }
}
