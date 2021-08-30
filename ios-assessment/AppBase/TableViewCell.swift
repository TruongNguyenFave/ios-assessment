//
//  TableViewCell.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/7/21.
//

import RxSwift
import UIKit

class TableViewCell: UITableViewCell, HasDisposeBag {
    var disposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()
        iosAssessmentDisposeBags()
    }
}
