//
//  HomeCoordinator.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import UIKit

class HomeCoordinator: HomeCoordinatorType {

    var detailsCoordinator: DetailsCoordinatorType?

    fileprivate let navigator: UINavigationController

    init(_ navigator: UINavigationController) {
        self.navigator = navigator
    }

    func start() {
        if let homeViewController = HomeViewController.loadFromStoryboard() as? HomeViewController {
            let homeModel = HomeViewModel()
            homeViewController.bindViewModelAndCoordinator(model: homeModel, andCoordinator: self)
            navigator.pushViewController(homeViewController, animated: true)
        }
    }

    func didTapMovie(_ movie: Movie) {
        detailsCoordinator = DetailsCoordinator(navigator, movie: movie)
        detailsCoordinator?.start()
    }

}
