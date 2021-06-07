//
//  SceneCoordinator.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/2/21.
//

import UIKit

protocol SceneCoordinatorType: Coordinator {
    var homeCoordinator: HomeCoordinatorType? { get set }
}

class SceneCoordinator: SceneCoordinatorType {

    var window: UIWindow?

    // Home is root screen so need declare
    var homeCoordinator: HomeCoordinatorType?
    var navigationController: UINavigationController

    init(_ window: UIWindow?) {
        self.window = window

        navigationController = UINavigationController()
        homeCoordinator = HomeCoordinator(navigationController)

    }

    func start() {
        window?.rootViewController = navigationController
        homeCoordinator?.start()
    }
}
