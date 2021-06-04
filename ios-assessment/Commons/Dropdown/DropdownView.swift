//
//  DropdownView.swift
//  Reward
//
//  Created by Nguyen Truong on 2/25/21.
//  Copyright © 2021 Nguyen Truong. All rights reserved.
//

import Foundation
import UIKit

struct DropdownItem {
    var decideType: Any
    var title: String

    init(decideType: Any, title: String) {
        self.decideType = decideType
        self.title = title
    }
}

class DropdownView: UIView {

    @IBOutlet fileprivate weak var contentView: UIView!
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var stackContainerView: UIView!

    var titleSelected: String = ""
    var items: [DropdownItem] = []
    var didTapItem: ((DropdownItem) -> Void)?
    var didHideItem: (()->Void)?
    var marginYwithDropDownView: CGFloat = 6
    var isShowHeader: Bool = false
    var textOfHeader: String = ""
    
    struct Defines {
        static let horizontalPadding: CGFloat = 16
        static let rowHeight: CGFloat = 28
        static let heightOfHeader: CGFloat = 28
        static let maxHeight = rowHeight * 5 + horizontalPadding
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialConfig()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialConfig()
    }

    private func initialConfig() {
        Bundle.main.loadNibNamed(DropdownView.className, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.isHidden = true
        self.backgroundColor = .clear
        
        configTableView()
    }

    func setListItems(_ items: [DropdownItem]) {
        self.items = items
        tableView.reloadData()
    }

    func hidenDropdown() {
        didHideItem?()
        self.isHidden = true
    }

    func showDropdown(with inputView: UIView?, parentView: UIView?) {

        if items.isEmpty {
            return
        }

        tableView.reloadData()
        
        let frameInput = getFrame(fromView: inputView, toView: parentView)

        // Set Frame
        self.frame = parentView?.bounds ?? .zero

        // Set Height
        var realHeight = CGFloat(items.count) * Defines.rowHeight + Defines.horizontalPadding
        if realHeight > Defines.maxHeight {
            realHeight = Defines.maxHeight
        }
        realHeight += isShowHeader ? Defines.heightOfHeader : 0
        let newFrame = CGRect(x: frameInput.origin.x,
                              y: frameInput.origin.y + frameInput.height + marginYwithDropDownView,
                              width: frameInput.width,
                              height: realHeight)
        stackContainerView.frame = newFrame
        self.isHidden = false
    }

    fileprivate func getFrame(fromView: UIView?, toView: UIView?) -> CGRect {
        if let frame = fromView?.frame {
            return fromView?.superview?.convert(frame, to: toView) ?? .zero
        }
        return .zero
    }

    @IBAction fileprivate func dismissAction(_ sender: Any) {
        hidenDropdown()
    }
}

// MARK: - UITableView
extension DropdownView: UITableViewDelegate, UITableViewDataSource {

    func configTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerNib(cellName: DropdownCell.className)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: DropdownCell.self, for: indexPath)
        if 0..<items.count ~= indexPath.row {
            cell.titleSelected = titleSelected
            cell.item = items[indexPath.row]
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Defines.rowHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if 0..<items.count ~= indexPath.row {
            didTapItem?(items[indexPath.row])
            hidenDropdown()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: Defines.heightOfHeader))

        let label = UILabel()
        label.frame = CGRect.init(x: 10, y: 0, width: headerView.frame.width, height: Defines.heightOfHeader)
        label.text = textOfHeader
        label.textColor = .black
        if titleSelected == "" {
            label.font = UIFont.boldSystemFont(ofSize: 14)
        } else {
            label.font = UIFont.systemFont(ofSize: 14)
        }
        headerView.addSubview(label)

        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return isShowHeader ? Defines.heightOfHeader : 0
    }
}
