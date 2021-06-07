//
//  DetailsViewModel.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import RxSwift

protocol DetailsViewModelOutput: class {
    func getDetailsSuccess()
}

class DetailsViewModel: DetailsViewModelType {

    weak var output: DetailsViewModelOutput?
    let repository = DetailsRepository()
    let bag = DisposeBag()

    var movie: Movie

    init(_ movie: Movie) {
        self.movie = movie
    }

    func getMovieDetails() {
        repository.getMovieDetails(movie.id).subscribe(onNext: { [weak self] movie in
            self?.movie = movie
            self?.output?.getDetailsSuccess()
        }, onError: { error in
            // TODOs:
            print(APIResponseError.getErrorMessage(from: error))
        }).disposed(by: bag)
    }

}
