//
//  AppSceneCoordinatorMock.swift
//  ios-assessmentTests
//
//  Created by Nguyen Truong on 6/7/21.
//

import Foundation
@testable import ios_assessment
import XCTest

class AppSceneCoordinatorMock: SceneCoordinatorType {
    
    var homeCoordinator: HomeCoordinatorType?

    var start_Called = false

    func start() {
        start_Called = true
        homeCoordinator?.start()
    }
}
