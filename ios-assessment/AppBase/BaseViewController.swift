//
//  BaseViewController.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/4/21.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func logDeinit() {
        print("\(self.className) DEINIT!!!")
    }

    deinit {
        logDeinit()
    }
}

// MARK: - Load View From Storyboard
extension BaseViewController {
    static func loadFromStoryboard<Self: BaseViewController>() -> Self {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: self.className) as? Self else {
            return Self()
        }
        return viewController
    }
}
