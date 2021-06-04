//
//  DetailsRepository.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/4/21.
//

import Foundation
import RxSwift

class DetailsRepository {
    func getMovieDetails(_ movieId: Int) -> Observable<Movie> {
        let input = MovieDetailsInput(movieId: movieId)
        return APIService.shared.getMovieDetails(input).map { output -> Movie in
            if let movie = output.movie {
                return movie
            }
            throw APIResponseError.message(output.message)
        }
    }
}
