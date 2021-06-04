//
//  HomeViewController.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, Bindable {
    
    var viewModel: HomeViewModel!
    var coordinator: HomeCoordinator!


    @IBOutlet fileprivate weak var tableView: UITableView!

    // Dropdown
    @IBOutlet fileprivate weak var dropdownInputView: DropdownInputView!
    fileprivate var dropdown: DropdownView?

    let bag = DisposeBag()

    let dataRelay = BehaviorRelay<[Movie]>(value: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCellConfiguration()
        configDropDown()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Home"
    }

    func setupCellConfiguration() {
        tableView.register(UINib(nibName: MovieCell.className, bundle: nil), forCellReuseIdentifier: MovieCell.className)
        tableView.refreshControl = UIRefreshControl()

        dataRelay.bind(to: tableView.rx.items(cellIdentifier: MovieCell.className, cellType: MovieCell.self)) {
            row, movie, cell in
            cell.movie = movie
        }.disposed(by: bag)

        // Load more
        tableView.rx.willDisplayCell.subscribe(onNext: {
            // load more when scroll to last cell
            guard self.dataRelay.value.count - $0.indexPath.row == 1 else { return }
            self.viewModel.getMoreMovies()
        })
        .disposed(by: bag)

        tableView.refreshControl?.rx.controlEvent(.valueChanged)
            .subscribe(onNext: { [weak self] in
                self?.tableView.refreshControl?.endRefreshing()
                self?.viewModel.getListMovies()
            })
            .disposed(by: bag)

        tableView.rx.modelSelected(Movie.self)
            .bind { [weak self] movie in
                self?.coordinator.didTapMovie(movie)
            }
            .disposed(by: bag)
    }

    func bindViewModelAndCoordinator() {
        viewModel.output = self
        viewModel.getListMovies()
    }

}

extension HomeViewController: HomeViewModelOuput {
    func refreshListMovie() {
        let movies = viewModel.movies
        dataRelay.accept(movies)
    }

    func refreshMoreMovie() {
        let movies = viewModel.lastMovies

        var lastData = dataRelay.value
        lastData.append(contentsOf: movies)
        dataRelay.accept(lastData)
    }
}

// MARK: - Dropdown
extension HomeViewController {
    func configDropDown() {
        dropdown = DropdownView()
        if let centreDropdown = self.dropdown {
            view.addSubview(centreDropdown)
        }
        dropdown?.didTapItem = { [weak self] item in
            self?.dropdownInputView.inputTitle = item.title
            guard let sortItem = item.decideType as? MovieSort else { return }
            self?.viewModel.sortItem = sortItem
            self?.viewModel.getListMovies()
        }
        dropdownInputView.changeInput = { [weak self] in
            self?.dropdown?.showDropdown(with: self?.dropdownInputView, parentView: self?.view)
        }

        // Setup display
        dropdownInputView.inputTitle = viewModel.sortItem.name
        dropdown?.setListItems(viewModel.sortItems.map({
            DropdownItem(decideType: $0, title: $0.name)
        }))
    }
}
