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
            // TODOs:
            durationLabel.text = "Duration: -"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction fileprivate func bookMovieAction(_ sender: Any) {
        if let url = URL.init(string: "https://www.cathaycineplexes.com.sg/") {
            openExternalApp(url)
        }
    }

    func openExternalApp(_ url: URL) {
        guard UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
