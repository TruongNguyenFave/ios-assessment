//
//  Bindable.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/2/21.
//

import UIKit

protocol Bindable: class {

    associatedtype ViewModel
    associatedtype Coordinator

    var viewModel: ViewModel! { get set }
    var coordinator: Coordinator! { get set }

    func bindViewModelAndCoordinator()

}

extension Bindable where Self: UIViewController {

    func bindViewModelAndCoordinator(model: Self.ViewModel, andCoordinator coordinator: Self.Coordinator) {
        self.viewModel = model
        self.coordinator = coordinator
        loadViewIfNeeded()
        bindViewModelAndCoordinator()
    }

}
