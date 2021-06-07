//
//  HomeViewControllerTest.swift
//  ios-assessmentTests
//
//  Created by Nguyen Truong on 6/7/21.
//

import XCTest
@testable import ios_assessment
import XCTest

class HomeViewControllerTest: XCTestCase, Bindable {

    var view: HomeViewController!
    var viewModel: HomeViewModelMock!
    var coordinator: HomeCoordinatorMock!

    // Mock
    var bindViewModelOutput_Called = false
    var refreshListMovie_Called = false
    var getMoreMovieSuccess_Called = false

    override func setUp() {
        super.setUp()
        view = HomeViewController.loadFromStoryboard()
        
        bindViewModelAndCoordinator(model: HomeViewModelMock(), andCoordinator: HomeCoordinatorMock())
        coordinator.detailsCoordinator = DetailsCoordinatorMock()
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

    func test_coordinator_didTapMovie() {
        coordinator.didTapMovie(Movie())
        XCTAssertTrue(coordinator.didTapMovie_Called)
        if let detailsCoordinator = coordinator.detailsCoordinator as? DetailsCoordinatorMock {
            XCTAssertTrue(detailsCoordinator.start_Called)
        }
    }

    // MARK: Test View Model
    func test_viewModel_getMoviesSuccess() {
        viewModel.getListMovies()
        XCTAssertTrue(viewModel.getListMovies_Called)
        XCTAssertTrue(refreshListMovie_Called)
    }

    func test_viewModel_getMoreMoviesSuccess() {
        viewModel.getMoreMovies()
        XCTAssertTrue(viewModel.getMoreMovies_Called)
        XCTAssertTrue(getMoreMovieSuccess_Called)
    }

}

extension HomeViewControllerTest: HomeViewModelOutput {
    func refreshListMovie() {
        refreshListMovie_Called = true
    }

    func getMoreMovieSuccess() {
        getMoreMovieSuccess_Called = true
    }
}
