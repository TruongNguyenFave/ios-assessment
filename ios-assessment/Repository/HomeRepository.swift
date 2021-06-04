//
//  HomeRepository.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import RxSwift

class HomeRepository {
    func getListMovies(with page: Int, and sortBy: String) -> Observable<[Movie]> {
        let input = MovieInput(with: page, and: sortBy)
        return APIService.shared.getListMovies(input).map { output -> [Movie] in
            if let movies = output.movies {
                return movies
            }
            throw APIResponseError.message(output.message)
        }
    }
}
