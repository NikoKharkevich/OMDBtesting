//
//  MoviesFeedRouter.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MoviesFeedRoutingLogic {
    func routeToMovieDetailsVC(segue: UIStoryboardSegue?, movieId :String)
}

protocol MovieDataPassing {
    var dataStore: MovieModel? { get }
}

class MoviesFeedRouter: MoviesFeedRoutingLogic {
    
    weak var viewController: MoviesFeedViewController?
    var dataStore: MovieData?
    
    // MARK: Routing
    func routeToMovieDetailsVC(segue: UIStoryboardSegue?, movieId: String) {
        if let segue = segue {
            let destinationVC = segue.destination as! MovieDetailsViewController
            var destinationDataStore = destinationVC.router?.dataStore
            passDataToShowDetail(source: dataStore!, destination: &destinationDataStore!, movieId: movieId)
        }
    }
    
    // MARK: Navigation
    func passDataToShowDetail(source: MovieData, destination: inout MovieDetailDataStore, movieId :String) {
        
        guard let selectedIndexPath = viewController?.moviesTableView.indexPathForSelectedRow else { return }
        let movies = source.search.map { MovieModel(data: $0) }
        let movieId = movies[selectedIndexPath.row].id
        destination.movieId = movieId
    }
    
}
