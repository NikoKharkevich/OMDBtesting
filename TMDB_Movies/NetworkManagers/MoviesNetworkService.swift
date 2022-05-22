//
//  MoviesFeedWorker.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 11.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct MoviesNetworkService {
    
    
    private let baseURL = "https://www.omdbapi.com/"
    private let apiKey = "9f1a4b55"
    
    //  search param  s=runner
    private let parameter = "runner"
    
    func fetchMoviesData(completion: @escaping(_ movies: [MovieModel]?) -> ()) {
        
        let urlString = "\(baseURL)?apikey=\(apiKey)&s=\(parameter)"
        print("Call URL string " + urlString)
        
        // Create a URL
        if let url = URL(string: urlString) {
            
            // Give a task to the session
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                guard error == nil else {
                    print(error!)
                    completion(nil)
                    return
                }
                
                guard let safeData = data else {
                    print("Data is empty")
                    completion(nil)
                    return
                }
                
                // Decode JSON
                let decoder = JSONDecoder()
                
                do {
                    let decodedData = try decoder.decode(MovieData.self, from: safeData)
                    let movies = decodedData.search.map { MovieModel(data: $0) }
                    print("Received JSON Data")
                    print("------------------")
                    
                    DispatchQueue.main.async {
                        completion(movies)
                    }
                    
                } catch {
                    print("JSON Error: \(error.localizedDescription)")
                    completion(nil)
                }
                
            }
            
            task.resume()
        }
    }
    
    
    func fetchMovieDetails(movieid: String, completion: @escaping(_ movie: MovieModel?) -> ()) {
        
        let urlString = "\(baseURL)?apikey=\(apiKey)&s=\(parameter)"
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                guard error == nil else {
                    print(error!)
                    completion(nil)
                    return
                }
                
                guard let safeData = data else {
                    print("Data is empty")
                    completion(nil)
                    return
                }
                
                // Decode JSON
                let decoder = JSONDecoder()
                
                do {
                    let decodedData = try decoder.decode(MovieData.self, from: safeData)
                    let movies = decodedData.search.map { MovieModel(data: $0) }
                    guard let index = movies.firstIndex(where: {$0.id == movieid}) else { return }
                    let movie = movies[index]
                    
                    print("Received JSON Data for movie details")
                    print("------------------")
                    
                    DispatchQueue.main.async {
                        completion(movie)
                    }
                    
                } catch {
                    print("JSON Error: \(error.localizedDescription)")
                    completion(nil)
                }
                
            }
            
            task.resume()
        }
    }
    
}
