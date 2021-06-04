//
//  UIViewController+Extensions.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import UIKit

// MARK: - Load View From Storyboard
extension UIViewController {
    static func loadFromStoryboard<Self: UIViewController>() -> Self {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: self.className) as? Self else {
            return Self()
        }
        return viewController
    }
}
