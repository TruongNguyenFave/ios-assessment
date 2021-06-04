//
//  SceneCoordinator.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/2/21.
//

import UIKit

class SceneCoordinator: Coordinator {

    var window: UIWindow?

    // Home is root screen so need declare
    var homeCoordinator: HomeCoordinator?
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
