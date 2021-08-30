//
//  BaseTableViewCell.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/7/21.
//

import Foundation

class BaseTableViewCell<T: BaseTableViewCellViewModel>: TableViewCell {

    var viewModel: T! {
        didSet {
            bind()
        }
    }

    open func bind() {

    }

}

extension BaseTableViewCell: ViewModelAssignable {

    func assignViewModel(viewModel: Any) {
        assert(viewModel is T, "\(viewModel.self) is not type of \(T.self)")
        if let viewModel = viewModel as? T {
            self.viewModel = viewModel
        }
    }

}

protocol ViewModelAssignable {
    func assignViewModel(viewModel: Any)
}
