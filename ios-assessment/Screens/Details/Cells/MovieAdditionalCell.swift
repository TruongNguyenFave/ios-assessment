//
//  MovieAdditionalCell.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/4/21.
//

import UIKit

class MovieAdditionalCell: BaseTableViewCell<MovieAdditionalCellViewModel> {

    @IBOutlet fileprivate weak var genresLabel: UILabel!
    @IBOutlet fileprivate weak var languageLabel: UILabel!
    @IBOutlet fileprivate weak var durationLabel: UILabel!
    @IBOutlet fileprivate weak var synopsisLabel: UILabel!

    override func bind() {
        guard let movie = self.viewModel.movie else { return }
        genresLabel.text = movie.genresDisplay
        languageLabel.text = movie.movieLanguage
        synopsisLabel.text = movie.overview
        durationLabel.text = movie.durationDisplay
    }
}
