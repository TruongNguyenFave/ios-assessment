//
//  DetailsViewModelMock.swift
//  ios-assessmentTests
//
//  Created by Nguyen Truong on 6/7/21.
//

import Foundation
@testable import ios_assessment
import XCTest

class DetailsViewModelMock: DetailsViewModelType {
    var output: DetailsViewModelOutput?

    var getMovieDetails_Called = false

    func getMovieDetails() {
        getMovieDetails_Called = true
        output?.getDetailsSuccess()
    }
}
