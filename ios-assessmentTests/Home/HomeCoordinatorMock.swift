//
//  HomeCoordinatorMock.swift
//  ios-assessmentTests
//
//  Created by Nguyen Truong on 6/4/21.
//

import Foundation
@testable import ios_assessment
import XCTest

class HomeCoordinatorMock: HomeCoordinatorType {

    var detailsCoordinator: DetailsCoordinatorType?

    var didTapMovie_Called = false
    var start_Called = false

    func didTapMovie(_ movie: Movie) {
        didTapMovie_Called = true
        detailsCoordinator?.start()
    }

    func start() {
        start_Called = true
    }
}
