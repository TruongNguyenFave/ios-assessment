//
//  DetailsViewModelType.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/7/21.
//

import Foundation

protocol DetailsViewModelType: ViewModel {
    var output: DetailsViewModelOutput? { get set }

    func getMovieDetails()
}
