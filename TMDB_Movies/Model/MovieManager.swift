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
    
    let movies = [MovieModel]()
    
    //  search param  s=runner
    private let parameter = "runner"
    
    func fetchMoviesData() {
        
        let urlString = "\(baseURL)?apikey=\(apiKey)&s=\(parameter)"
        print(urlString)
        
        self.performReques(with: urlString)
        
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
            
            decodedData.search.enumerated().forEach({ index, element in
                let title = element.title
                let year = element.year
                _ = element.poster
                
                print("Title: \(title). Year: \(year)")
            })

            return movies
            
        } catch {
            print("JSON Error: \(error.localizedDescription)")
            return nil
        }
    }
}
