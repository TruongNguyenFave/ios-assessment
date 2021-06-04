//
//  DetailsCoordinator.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import UIKit

class DetailsCoordinator: Coordinator {

    fileprivate let navigator: UINavigationController
    fileprivate let movie: Movie

    init(_ navigator: UINavigationController, movie: Movie) {
        self.navigator = navigator
        self.movie = movie
    }

    func start() {
        let homeViewController = DetailsViewController.loadFromStoryboard() as! DetailsViewController
        let detailsModel = DetailsViewModel(self.movie)
        homeViewController.bindViewModelAndCoordinator(model: detailsModel, andCoordinator: self)
        navigator.pushViewController(homeViewController, animated: true)
    }

}
