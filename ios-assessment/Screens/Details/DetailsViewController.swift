//
//  DetailsViewController.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import UIKit
import RxSwift
import RxCocoa

class DetailsViewController: BaseViewController, Bindable {

    var viewModel: DetailsViewModel!
    var coordinator: DetailsCoordinator!

    @IBOutlet fileprivate weak var tableView: UITableView!
    let bag = DisposeBag()

    enum DetailsMovieCellType {
        case movie // it's same display on home
        case addtional // Synopsis/Genres/Language/Duration
    }

    let dataRelay = BehaviorRelay<[DetailsMovieCellType]>(value: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ScreenNameDefines.details
        setupCellConfiguration()
    }

    func bindViewModelOutput() {
        viewModel.output = self
        viewModel.getMovieDetails()
    }

    func setupCellConfiguration() {
        tableView.registerNib(cellName: MovieCell.className)
        tableView.registerNib(cellName: MovieAdditionalCell.className)

        dataRelay.bind(to: tableView.rx.items) { (tableView, row, type) -> UITableViewCell in
            let indexPath = IndexPath(row: row, section: 0)
            switch type {
            case .movie:
                let cell = tableView.dequeueReusableCell(withClass: MovieCell.self, for: indexPath)
                cell.movie = self.viewModel.movie
                return cell
            case .addtional:
                let cell = tableView.dequeueReusableCell(withClass: MovieAdditionalCell.self, for: indexPath)
                cell.movie = self.viewModel.movie
                return cell
            }
        }.disposed(by: bag)

    }

}

// MARK: View Model Output
extension DetailsViewController: DetailsViewModelOutput {
    func getDetailsSuccess() {
        dataRelay.accept([.movie, .addtional])
    }
}

// MARK: Actions
extension DetailsViewController {
    @IBAction fileprivate func bookMovieAction(_ sender: Any) {
        coordinator.bookTheVideo()
    }
}
