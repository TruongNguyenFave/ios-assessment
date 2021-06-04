//
//  DropdownCell.swift
//  Durian
//
//  Created by Nguyen Truong on 4/19/21.
//

import UIKit

class DropdownCell: UITableViewCell {

    @IBOutlet fileprivate weak var titleLabel: UILabel!

    var titleSelected: String = ""
    var item: DropdownItem? {
        didSet {
            titleLabel.text = item?.title
            if titleSelected == item?.title {
                titleLabel.font = UIFont.boldSystemFont(ofSize: titleLabel.font.pointSize)
            } else {
                titleLabel.font = UIFont.systemFont(ofSize: titleLabel.font.pointSize)
            }
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
