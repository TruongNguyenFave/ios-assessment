//
//  UIView+Extensions.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/4/21.
//

import Foundation
import UIKit

// MARK: - IBInspectables
extension UIView {

    @IBInspectable var radius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.black.cgColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}

