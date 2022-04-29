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
        
        movies = movieManager.fetchMovies()
        
//        let movie1 = MovieModel(title: "Test", year: "2022", poster: "post")
//        movies.append(movie1)

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

extension TableViewController {
    
//    func fetchData() -> [MoviesModel] {
//
//        let movie1 = MoviesModel(title: "Halo", image: UIImage(named: "Halo")!)
//        let movie2 = MoviesModel(title: "Moon Knight", image: UIImage(named: "MoonKnight")!)
//        let movie3 = MoviesModel(title: "The Batman", image: UIImage(named: "TheBatman")!)
//        let movie4 = MoviesModel(title: "Uncharted", image: UIImage(named: "Uncharted")!)
        
//        return [movie1, movie2, movie3, movie4]
//    }
}
