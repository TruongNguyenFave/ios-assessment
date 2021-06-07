//
//  HomeViewModelMock.swift
//  ios-assessmentTests
//
//  Created by Nguyen Truong on 6/4/21.
//

import Foundation
@testable import ios_assessment
import XCTest

class HomeViewModelMock: HomeViewModelType {
    var output: HomeViewModelOutput?

    var getListMovies_Called = false
    var getMoreMovies_Called = false

    func getListMovies() {
        getListMovies_Called = true
        output?.refreshListMovie()
    }
    
    func getMoreMovies() {
        getMoreMovies_Called = true
        output?.getMoreMovieSuccess()
    }

}
