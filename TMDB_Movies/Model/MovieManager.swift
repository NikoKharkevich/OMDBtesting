//
//  MovieManager.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 27.04.2022.
//

import Foundation

struct MovieManager {
    
    private let baseURL = "https://www.omdbapi.com/"
    private let apiKey = "9f1a4b55"
    
    //  search param  s=runner
    private let parameter = "runner"
    
    func fetchMoviesData(completion: @escaping(_ movies: [MovieModel]?) -> ()) {
        
        let urlString = "\(baseURL)?apikey=\(apiKey)&s=\(parameter)"
        print(urlString)
        
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
                    print("Data")
                    completion(movies)

                } catch {
                    print("JSON Error: \(error.localizedDescription)")
                    completion(nil)
                }
                
            }

            task.resume()
        }
    }
}


//    private func parseJSON(_ data: Data) -> [MovieModel]? {
//
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(MovieData.self, from: data)
//
//            return decodedData.search.map { MovieModel(data: $0) }
//
//        } catch {
//            print("JSON Error: \(error.localizedDescription)")
//            return nil
//        }
