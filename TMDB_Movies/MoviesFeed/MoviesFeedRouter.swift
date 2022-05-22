//
//  MoviesFeedRouter.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MoviesFeedRoutingLogic {
    func routeToMovieDetails(segue: UIStoryboardSegue?, movieId :String)
}

protocol MovieListDataPassing {
    var dataStore: MovieListDataStore? { get }
}

class MoviesFeedRouter: MoviesFeedRoutingLogic, MovieListDataPassing {
    
    weak var viewController: MoviesFeedViewController?
    var dataStore: MovieListDataStore?
    
    // MARK: Routing
    func routeToMovieDetails(segue: UIStoryboardSegue?, movieId: String) {
        if let segue = segue {
            guard let dataStore = dataStore,
                  let destinationVC = segue.destination as? MovieDetailsViewController,
                  var destinationDataStore = destinationVC.router?.dataStore
//            else { fatalError("Fail route to detail") }
            else { return }
            passDataToShowDetail(source: dataStore, destination: &destinationDataStore, movieId: movieId)
        }
    }
    
    // MARK: Passing data
    func passDataToShowDetail(source: MovieListDataStore, destination: inout MovieDetailDataStore, movieId :String) {
        
        guard let selectedIndexPath = viewController?.moviesTableView.indexPathForSelectedRow else { return }
        destination.movieId = source.movies![selectedIndexPath.row].id
    }
    
}
