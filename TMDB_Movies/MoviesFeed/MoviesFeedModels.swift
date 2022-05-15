//
//  MoviesFeedModels.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum MoviesFeed {
    
    enum Model {
        struct Request {
            enum RequestType {
                case some
                case getFeed
            }
        }
        struct Response {
            enum ResponseType {
                case some
                case presentMoviesFeed
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case some
                case displayMoviesFeed
            }
        }
    }
    
}
