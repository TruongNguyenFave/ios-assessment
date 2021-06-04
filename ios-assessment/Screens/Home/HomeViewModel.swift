//
//  LoginViewModel.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeViewModelOuput: class {
    func refreshListMovie()
    func refreshMoreMovie()
}

class HomeViewModel: ViewModel {

    weak var output: HomeViewModelOuput?

    fileprivate let repository = HomeRepository()
    let bag = DisposeBag()

    var isLoading = false
    var isLoadMoreLoading = false

    var movies: [Movie] = []
    var lastMovies: [Movie] = []

    // Condition
    var page = 1

    // Sort
    var sortItems: [MovieSort] = MovieSort.items
    var sortItem: MovieSort = MovieSort.sortItemDefault

    func getListMovies() {
        if isLoading {
            // Just continue get movies when load success
            return
        }
        isLoading = true
        // Reset page
        page = 1

        repository.getListMovies(with: page, and: sortItem.sortBy).subscribe(onNext: { [weak self] movies in
            self?.movies = movies
            self?.output?.refreshListMovie()
            self?.isLoading = false
        }, onError: { [weak self] error in
            self?.isLoading = false
            // TODOs:
            print(error)
        }).disposed(by: bag)
    }

    func getMoreMovies() {
        if isLoading {
            // Just continue get movies when load success
            return
        }
        isLoading = true
        // Reset page
        page += 1

        repository.getListMovies(with: page, and: sortItem.sortBy).subscribe(onNext: { [weak self] movies in
            self?.lastMovies = movies
            self?.output?.refreshMoreMovie()
            self?.isLoading = false
        }, onError: { [weak self] error in
            self?.isLoading = false
            // TODOs:
            print(error)
        }).disposed(by: bag)
    }
}
