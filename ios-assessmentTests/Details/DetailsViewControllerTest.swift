//
//  DetailsViewControllerTest.swift
//  ios-assessmentTests
//
//  Created by Nguyen Truong on 6/7/21.
//

import Foundation
@testable import ios_assessment
import XCTest

class DetailsViewControllerTest: XCTestCase, Bindable {

    var view: DetailsViewController!
    var viewModel: DetailsViewModelMock!
    var coordinator: DetailsCoordinatorMock!

    // Mock
    var bindViewModelOutput_Called = false
    var getDetailsSuccess_Called = false

    override func setUp() {
        super.setUp()
        view = DetailsViewController.loadFromStoryboard()

        bindViewModelAndCoordinator(model: DetailsViewModelMock(), andCoordinator: DetailsCoordinatorMock())
        coordinator.start()
    }

    func bindViewModelOutput() {
        bindViewModelOutput_Called = true
        viewModel.output = self
    }

    func test_loadNib() {
        view.loadView()
        XCTAssertNotNil(view.view)
    }

    // MARK: Test Coordinator
    func test_coordinator_start() {
        XCTAssertTrue(bindViewModelOutput_Called)
        XCTAssertTrue(coordinator.start_Called)
    }

    func test_coordinator_bookTheVideo() {
        coordinator.bookTheVideo()
        XCTAssertTrue(coordinator.bookTheVideo_Called)
    }

    // MARK: Test View Model
    func test_viewModel_getMovieDetailsSuccess() {
        viewModel.getMovieDetails()
        XCTAssertTrue(viewModel.getMovieDetails_Called)
        XCTAssertTrue(getDetailsSuccess_Called)
    }

}

extension DetailsViewControllerTest: DetailsViewModelOutput {
    func getDetailsSuccess() {
        getDetailsSuccess_Called = true
    }
}
