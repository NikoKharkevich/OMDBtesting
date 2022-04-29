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
    
    //  item param  i=tt3896198
    private let parameter = "i=tt3896198"
    
    let movies = [MovieModel]()
    
    //  search param  s=runner
//    let parameter = "s=runner"
    
    func fetchMovies() -> [MovieModel] {
        
        let urlString = "\(baseURL)?apikey=\(apiKey)&\(parameter)"
        print(urlString)
        
        self.performReques(with: urlString)
        
        return movies
    }
    
    private func performReques(with urlString: String) {
        
        // 1. Create a URL
        if let url = URL(string: urlString) {
            
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give a task to the session
            let task = session.dataTask(with: url) { (data, response, error) in
                
                // Error during request
                if error != nil {
                    print(error!.localizedDescription)
                    
                    // return to exit session.dataTask and do not continue
                    return
                }
                
                // If no error we check the Data we received
                if let safeData = data {
                    self.parseJSON(safeData)
                    
                }
                return
                
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    private func parseJSON(_ data: Data) -> [MovieModel]? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MovieData.self, from: data)
            
            let title = decodedData.title
            let year = decodedData.year
            let poster = decodedData.poster
            
            var movies: [MovieModel] = []
            let movie = MovieModel(title: title, year: year, poster: poster)
            
            movies.append(movie)
            
            print(title)
            print(year)
            
            return movies
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
