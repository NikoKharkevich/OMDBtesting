//
//  MoviesFeedRouter.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MoviesFeedRoutingLogic {
    func routeToDetails(segue: UIStoryboardSegue?)
}

protocol MovieListDataPassing {
    var dataStore: MovieListDataStore? { get }
}

class MoviesFeedRouter: MoviesFeedRoutingLogic, MovieListDataPassing {
    
    weak var viewController: MoviesFeedViewController?
    var dataStore: MovieListDataStore?
    
    // MARK: Routing
    func routeToDetails(segue: UIStoryboardSegue?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let dataStore = dataStore {
            guard let destinationVC = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController,
                  var destinationDS = destinationVC.router!.dataStore else { return }

            passDataToDetails(source: dataStore, destination: &destinationDS)
            navigateToDetails(source: viewController!, destination: destinationVC)
        } else {
            print("Passing data error ❌")
        }
    }
    
    // MARK: Navigation
    func navigateToDetails(source: MoviesFeedViewController, destination: MovieDetailsViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: Passing data
    func passDataToDetails(source: MovieListDataStore, destination: inout MovieDetailDataStore) {
        
        guard let selectedIndexPath = viewController?.moviesTableView.indexPathForSelectedRow,
              let movies = source.movies else { return }
        let movie = movies[selectedIndexPath.row]

//        destination.movie = movie
        destination.movie?.title = movie.title
        destination.movie?.poster = movie.poster
        destination.movie?.id = movie.id
        destination.movie?.year = movie.year

    }
    
}
