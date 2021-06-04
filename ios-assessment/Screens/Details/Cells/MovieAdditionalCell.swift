//
//  MovieAdditionalCell.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/4/21.
//

import UIKit

class MovieAdditionalCell: UITableViewCell {

    @IBOutlet fileprivate weak var genresLabel: UILabel!
    @IBOutlet fileprivate weak var languageLabel: UILabel!
    @IBOutlet fileprivate weak var durationLabel: UILabel!
    @IBOutlet fileprivate weak var synopsisLabel: UILabel!

    var movie: Movie? {
        didSet {
            guard let movie = self.movie else { return }
            genresLabel.text = movie.genresDisplay
            languageLabel.text = movie.movieLanguage
            synopsisLabel.text = movie.overview
            durationLabel.text = movie.durationDisplay
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
