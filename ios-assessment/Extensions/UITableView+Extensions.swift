//
//  UITableView+Extensions.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/4/21.
//

import Foundation
import UIKit

extension UITableView {

    public func registerNib(cellName name: String) {
        register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }

    public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as! T
    }
}
