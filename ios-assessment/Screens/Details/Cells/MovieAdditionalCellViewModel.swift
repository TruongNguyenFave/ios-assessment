//
//  MovieAdditionalCellViewModel.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/7/21.
//

import Foundation

class MovieAdditionalCellViewModel: BaseTableViewCellViewModel {

    let movie: Movie?

    init(_ movie: Movie?) {
        self.movie = movie
    }

}
