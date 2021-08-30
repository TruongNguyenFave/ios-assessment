//
//  UIView+Extensions.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/4/21.
//

import Foundation
import UIKit
import RxSwift

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

extension UIView {
    /// Use only to dispose of subscriptions inside resuable views
    func iosAssessmentDisposeBags() {
        if var hasDisposeBagView = self as? HasDisposeBag {
            hasDisposeBagView.disposeBag = DisposeBag()
        }

        let subViews = self.subviews

        guard !subViews.isEmpty else { return }

        for subView in subViews {
            subView.iosAssessmentDisposeBags()
        }
    }
}
