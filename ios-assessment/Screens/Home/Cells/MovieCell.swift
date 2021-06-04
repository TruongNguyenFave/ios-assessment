//
//  MovieCell.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {

    @IBOutlet fileprivate weak var movieTitlelabel: UILabel!
    @IBOutlet fileprivate weak var popularityLabel: UILabel!
    @IBOutlet fileprivate weak var posterImageView: UIImageView!
    @IBOutlet fileprivate weak var backdropImageView: UIImageView!

    var movie: Movie? {
        didSet {
            guard let movie = self.movie else { return }
            movieTitlelabel.text = movie.originalTitle
            popularityLabel.text = "Popularity: \(movie.popularity)"

            posterImageView.image = nil
            if let posterPathUrl = movie.posterPathUrl {
                posterImageView.sd_setImage(with: posterPathUrl, placeholderImage: nil)
            }

            backdropImageView.image = nil
            if let backdropPathUrl = movie.backdropPathUrl {
                backdropImageView.sd_setImage(with: backdropPathUrl, placeholderImage: nil)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
