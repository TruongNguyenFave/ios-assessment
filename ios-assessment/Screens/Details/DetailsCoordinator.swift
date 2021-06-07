//
//  DetailsCoordinator.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import UIKit

class DetailsCoordinator: DetailsCoordinatorType {

    fileprivate let navigator: UINavigationController
    fileprivate let movie: Movie

    init(_ navigator: UINavigationController, movie: Movie) {
        self.navigator = navigator
        self.movie = movie
    }

    func start() {
        if let homeViewController = DetailsViewController.loadFromStoryboard() as? DetailsViewController {
            let detailsModel = DetailsViewModel(self.movie)
            homeViewController.bindViewModelAndCoordinator(model: detailsModel, andCoordinator: self)
            navigator.pushViewController(homeViewController, animated: true)
        }
    }

    func bookTheVideo() {
        if let url = URL.init(string: AppDefines.bookingPath) {
            openExternalApp(url)
        }
    }

    fileprivate func openExternalApp(_ url: URL) {
        guard UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

}
