//
//  CustomCell.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 26.04.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    
    var moviewImageView = UIImageView()
    var movieTitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(moviewImageView)
        addSubview(movieTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
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
        movieTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: moviewImageView.trailingAnchor, constant: 20).isActive = true
        movieTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func set(movie: MovieModel) {
//        moviewImageView.image = movie.image
        movieTitleLabel.text = movie.title
        
    }
    
}
