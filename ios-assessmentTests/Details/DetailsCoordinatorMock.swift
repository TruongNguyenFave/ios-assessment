//
//  DetailsCoordinatorMock.swift
//  ios-assessmentTests
//
//  Created by Nguyen Truong on 6/7/21.
//

import Foundation
@testable import ios_assessment
import XCTest

class DetailsCoordinatorMock: DetailsCoordinatorType {
    var start_Called = false
    var bookTheVideo_Called = false

    func start() {
        start_Called = true
    }

    func bookTheVideo() {
        bookTheVideo_Called = true
    }
}
