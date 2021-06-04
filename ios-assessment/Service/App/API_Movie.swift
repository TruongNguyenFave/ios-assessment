//
//  API_Movie.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import RxSwift
import ObjectMapper

extension APIService {
    func getListMovies(_ input: MovieInput) -> Observable<MovieOutput> {
        return request(input)
    }

    func getMovieDetails(_ input: MovieDetailsInput) -> Observable<MovieDetailsOutput> {
        return request(input)
    }
}

// MARK: List
class MovieInput: APIBaseInput {
    init(with page: Int, and sortBy: String) {
        let params:  [String : Any] = [
            "api_key": "328c283cd27bd1877d9080ccb1604c91",
            "primary_release_date.lte": "2016-12-31",
            "sort_by": sortBy,
            "page": page
        ]

        super.init(urlString: APIURL.movie,
                   method: .get,
                   parameters: nil,
                   urlParams: params,
                   headersType: .normal)
    }
}

class MovieOutput: APIBaseOutput {

    var movies: [Movie]?

    override func mapping(map: Map) {
        super.mapping(map: map)
        movies <- map["results"]
    }
}

// MARK: Details
class MovieDetailsInput: APIBaseInput {
    init(movieId: Int) {
        let params:  [String : Any] = [
            "api_key": "328c283cd27bd1877d9080ccb1604c91",
        ]
        let urlString = String(format: APIURL.movieDetails, movieId)
        super.init(urlString: urlString,
                   method: .get,
                   parameters: nil,
                   urlParams: params,
                   headersType: .normal)
    }
}

class MovieDetailsOutput: APIBaseOutput {

    var movie: Movie?

    override func mapping(map: Map) {
        super.mapping(map: map)
        movie = Movie.init(JSON: map.JSON)
    }
}

