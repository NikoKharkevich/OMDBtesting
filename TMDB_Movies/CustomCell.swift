//
//  CustomCell.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 26.04.2022.
//

import UIKit
import Kingfisher

class CustomCell: UITableViewCell {  //namimg
    
    var moviewImageView = UIImageView() //naming
    var movieTitleLabel = UILabel()
    var movieYearLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        [moviewImageView, movieTitleLabel].forEach(addSubview)
        addSubview(moviewImageView)
        addSubview(movieTitleLabel)
        addSubview(movieYearLabel)
        
        configureImageView()
        configureTitleLabel()
        configureYearLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func configureImageView() {
        moviewImageView.layer.cornerRadius = 10
        moviewImageView.clipsToBounds = true
        
        moviewImageView.translatesAutoresizingMaskIntoConstraints = false
        moviewImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        moviewImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        moviewImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        moviewImageView.widthAnchor.constraint(equalTo: moviewImageView.heightAnchor, multiplier: 2/3).isActive = true
    }
    
    
    func configureTitleLabel() {
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: -30).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: moviewImageView.trailingAnchor, constant: 20).isActive = true
        movieTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func configureYearLabel() {
        movieYearLabel.numberOfLines = 0
        movieYearLabel.adjustsFontSizeToFitWidth = true
        
        movieYearLabel.translatesAutoresizingMaskIntoConstraints = false
        movieYearLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 12).isActive = true
        movieYearLabel.leadingAnchor.constraint(equalTo: moviewImageView.trailingAnchor, constant: 20).isActive = true
        movieYearLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        movieYearLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func set(movie: MovieModel) {
        
            self.moviewImageView.kf.indicatorType = .activity
            self.moviewImageView.kf.setImage(with: URL(string: movie.poster))
            
            self.movieTitleLabel.text = movie.title
            
            self.movieYearLabel.text = movie.year
        
    }
    
}
