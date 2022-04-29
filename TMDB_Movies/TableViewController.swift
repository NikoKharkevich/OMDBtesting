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
        
        // assigning test data
        movies = fetchData()
        
        // calling real Data Fetcher
        movieManager.fetchMoviesData()

        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return movies.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.set(movie: movies[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


// MARK: - Hardcoded Test Data
extension TableViewController {
    
    func fetchData() -> [MovieModel] {

        let movie1 = MovieModel(title: "Blade Runner 2049", year: "2017", poster: "https://www.themoviedb.org/t/p/w1280/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg")
        let movie2 = MovieModel(title: "The Maze Runner", year: "2014", poster: "https://www.themoviedb.org/t/p/w1280/ode14q7WtDugFDp78fo9lCsmay9.jpg")
        
        return [movie1, movie2]
    }
}
