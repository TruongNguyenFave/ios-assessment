//
//  Movie.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import ObjectMapper

struct Movie {
    var id: Int
    var title: String
    var backdropPath: String
    var posterPath: String
    var popularity: Float

    // Addtional
    var overview: String
    var genres: [Genre]
    var spokenLanguages: [Language]
    var runtime: Int

    init() {
        id = 0
        title = ""
        backdropPath = ""
        posterPath = ""
        popularity = 0
        overview = ""
        genres = []
        spokenLanguages = []
        runtime = 0
    }
}

extension Movie: Mappable {
    init?(map: Map) {
        self.init()
    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        backdropPath <- map["backdrop_path"]
        posterPath <- map["poster_path"]
        popularity <- map["popularity"]
        overview <- map["overview"]
        genres <- map["genres"]
        spokenLanguages <- map["spoken_languages"]
        runtime <- map["runtime"]
    }
}

extension Movie {
    var backdropPathUrl: URL? {
        return URL.init(string: "https://image.tmdb.org/t/p/w500/" + backdropPath)
    }

    var posterPathUrl: URL? {
        return URL.init(string: "https://image.tmdb.org/t/p/w500/" + posterPath)
    }

    var genresDisplay: String {
        let generesName = genres.map({ $0.name })
        return "Genres: " + generesName.joined(separator: " * ")
    }

    var movieLanguage: String {
        return "Language: " + (spokenLanguages.first?.name ?? "English")
    }

    var durationDisplay: String {
        return "Duration: \(runtime) minutes"
    }
}
