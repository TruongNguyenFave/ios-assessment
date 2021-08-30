//
//  DetailsViewModel.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

protocol DetailsViewModelOutput: class {
    func getDetailsSuccess()
}

enum DetailsMovieCellType {
    case movie // it's same display on home
    case addtional // Synopsis/Genres/Language/Duration
}

struct DetailsSectionModelItem {
    var viewModel: BaseTableViewCellViewModel
    var type: DetailsMovieCellType
}

struct DetailsSectionModel {
    var items: [Item]
}

extension DetailsSectionModel: SectionModelType {
    typealias Item = DetailsSectionModelItem

    init(original: DetailsSectionModel, items: [DetailsSectionModelItem]) {
        self = original
        self.items = items
    }
}

class DetailsViewModel: DetailsViewModelType {

    weak var output: DetailsViewModelOutput?
    let repository = DetailsRepository()
    let bag = DisposeBag()

    var sectionsModels: BehaviorRelay<[DetailsSectionModel]> = BehaviorRelay(value: [])

    var movie: Movie

    init(_ movie: Movie) {
        self.movie = movie
    }

    func getMovieDetails() {
        repository.getMovieDetails(movie.id).subscribe(onNext: { [weak self] movie in
            self?.movie = movie
            // TODOs:
            self?.output?.getDetailsSuccess()
            self?.configureSectionModel(movie)
        }, onError: { error in
            // TODOs:
            print(APIResponseError.getErrorMessage(from: error))
        }).disposed(by: bag)
    }

    private func configureSectionModel(_ movie: Movie) {
        var items: [DetailsSectionModelItem] = []
        items.append(DetailsSectionModelItem(viewModel: MovieAdditionalCellViewModel(movie),
                                             type: .addtional))
        let sectionModel = DetailsSectionModel(items: items)
        sectionsModels.accept([sectionModel])
    }

    let dataSource = RxTableViewSectionedReloadDataSource<DetailsSectionModel> {
        (_, tableView, indexPath, item) -> UITableViewCell in
        switch item.type {
        case .movie:
            let cell = tableView.dequeueReusableCell(withClass: MovieCell.self, for: indexPath)
//            cell.movie = self.movie
            return cell
        case .addtional:
            let cell = tableView.dequeueReusableCell(withClass: MovieAdditionalCell.self, for: indexPath)
            cell.assignViewModel(viewModel: item.viewModel)
            return cell
        }
    }

}
