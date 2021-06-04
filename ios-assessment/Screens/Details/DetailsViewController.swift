//
//  DetailsViewController.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import UIKit
import RxSwift
import RxCocoa

class DetailsViewController: UIViewController, Bindable {

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
        title = "Details"
        setupCellConfiguration()
    }

    func bindViewModelAndCoordinator() {
        viewModel.output = self
        viewModel.getMovieDetails()
    }

    func setupCellConfiguration() {
        tableView.register(UINib(nibName: MovieCell.className, bundle: nil), forCellReuseIdentifier: MovieCell.className)
        tableView.register(UINib(nibName: MovieAdditionalCell.className, bundle: nil), forCellReuseIdentifier: MovieAdditionalCell.className)

        dataRelay.bind(to: tableView.rx.items){ (tableView, row, type) -> UITableViewCell in
            let indexPath = IndexPath(row: row, section: 0)
            switch type {
            case .movie:
                if  let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.className, for: indexPath) as? MovieCell {
                    cell.movie = self.viewModel.movie
                    return cell
                } else {
                    return UITableViewCell()
                }
            case .addtional:
                if  let cell = tableView.dequeueReusableCell(withIdentifier: MovieAdditionalCell.className, for: indexPath) as? MovieAdditionalCell {
                    cell.movie = self.viewModel.movie
                    return cell
                } else {
                    return UITableViewCell()
                }
            }
        }.disposed(by: bag)

    }

}

extension DetailsViewController: DetailsViewModelOutput {
    func getDetailsSuccess() {
        dataRelay.accept([.movie, .addtional])
    }
}
