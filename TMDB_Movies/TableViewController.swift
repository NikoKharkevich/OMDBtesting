//
//  TableViewController.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 26.04.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    var movies: [MovieModel] = []
    var movieManager = MovieManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // calling Data Fetcher
        movieManager.fetchMoviesData { movies in
            print("Call fetcher")
            
            if let decodedMovies = movies {
                self.movies = decodedMovies
                self.tableView.reloadData()
                print("Fetcher success")

            } else {
                print("Fetcher Error")
            }
        }

        tableView.register(MovieCell.self, forCellReuseIdentifier: "CustomCell")
    }

    // MARK: - TableView Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! MovieCell
        cell.configure(movie: movies[indexPath.row])

        return cell
    }
    
    // MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
