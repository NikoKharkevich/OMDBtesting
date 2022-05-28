//
//  MoviesFeedRouter.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MoviesFeedRoutingLogic {
    func routeToDetails(movie: MovieModel)
}

protocol MovieListDataPassing {
    var dataStore: MovieListDataStore? { get }
}

class MoviesFeedRouter: MoviesFeedRoutingLogic, MovieListDataPassing {
    
    weak var viewController: MoviesFeedViewController?
    var dataStore: MovieListDataStore?
    
    // MARK: Routing
    func routeToDetails(movie: MovieModel) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let dataStore = dataStore {
            guard let destinationVC = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController,
                  var destinationDS = destinationVC.router!.dataStore else { return }

            passDataToDetails(source: dataStore, destination: &destinationDS, movie: movie)
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
    func passDataToDetails(source: MovieListDataStore, destination: inout MovieDetailDataStore, movie: MovieModel) {
        destination.movie = .init(data: movie)
    }
    
}
