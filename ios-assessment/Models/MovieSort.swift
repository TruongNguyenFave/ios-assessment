//
//  MovieSort.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/4/21.
//

import Foundation

struct MovieSort {
    var name: String
    var sortBy: String

    init() {
        name = ""
        sortBy = ""
    }

    init(_ name: String, sortBy: String) {
        self.name = name
        self.sortBy = sortBy
    }
}

extension MovieSort {
    static var items: [MovieSort] {
        return [
            sortItemDefault,
            MovieSort("Alphabetical", sortBy: "original_title.asc"),
            MovieSort("Rating", sortBy: "popularity.desc")
        ]
    }

    static var sortItemDefault: MovieSort {
        return MovieSort("Release date", sortBy: "release_date.desc")
    }
}
