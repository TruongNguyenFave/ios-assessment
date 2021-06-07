//
//  BindableTest.swift
//  ios-assessmentTests
//
//  Created by Nguyen Truong on 6/7/21.
//

import Foundation
@testable import ios_assessment
import XCTest

extension Bindable where Self: XCTestCase {
    func bindViewModelAndCoordinator(model: Self.ViewModel, andCoordinator coordinator: Self.Coordinator) {
        self.viewModel = model
        self.coordinator = coordinator
        bindViewModelOutput()
    }
}
