//
//  AppSceneTest.swift
//  ios-assessmentTests
//
//  Created by Nguyen Truong on 6/7/21.
//

import Foundation
@testable import ios_assessment
import XCTest

class AppSceneTest: XCTestCase {
    
    var coordinator: AppSceneCoordinatorMock!

    override func setUp() {
        super.setUp()

        coordinator = AppSceneCoordinatorMock()
        coordinator.homeCoordinator = HomeCoordinatorMock()
        coordinator.start()
    }

    // MARK: Test Coordinator
    func test_coordinator_start() {
        XCTAssertTrue(coordinator.start_Called)
        if let homeCoordinator = coordinator.homeCoordinator as? HomeCoordinatorMock {
            XCTAssertTrue(homeCoordinator.start_Called)
        }
    }

}
