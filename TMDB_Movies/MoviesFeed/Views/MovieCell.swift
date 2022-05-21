//
//  MovieCell.swift
//  TMDB_Movies
//
//  Created by Nikola Kharkevich on 26.04.2022.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    
    var posterImageView = UIImageView()
    var titleLabel = UILabel()
    var yearLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [posterImageView, titleLabel, yearLabel].forEach(addSubview)
        
        configurePosterImage()
        configureTitleLabel()
        configureYearLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurePosterImage() {
        posterImageView.layer.cornerRadius = 10
        posterImageView.clipsToBounds = true
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        posterImageView.widthAnchor.constraint(equalTo: posterImageView.heightAnchor, multiplier: 2/3).isActive = true
    }
    
    
    func configureTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func configureYearLabel() {
        yearLabel.numberOfLines = 0
        yearLabel.adjustsFontSizeToFitWidth = true
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        yearLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20).isActive = true
        yearLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        yearLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
    }
    
    func configure(movie: MovieModel) {
        
        self.posterImageView.kf.indicatorType = .activity
        self.posterImageView.kf.setImage(with: URL(string: movie.poster))
        
        self.titleLabel.text = movie.title
        
        self.yearLabel.text = movie.year
        
    }
    
}
