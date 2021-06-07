//
//  HomeViewModelType.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/7/21.
//

import Foundation

protocol HomeViewModelType: ViewModel {

    var output: HomeViewModelOutput? { get set }

    func getListMovies()
    func getMoreMovies()
}
