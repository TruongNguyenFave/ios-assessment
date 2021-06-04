//
//  NSObject+Extensions.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation

extension NSObject {

    @objc var className: String {
        return String(describing: type(of: self))
    }

    @objc class var className: String {
        return String(describing: self)
    }

}
