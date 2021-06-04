//
//  Genre.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/4/21.
//

import Foundation
import ObjectMapper

struct Genre {
    var id: Int
    var name: String

    init() {
        id = 0
        name = ""
    }
}

extension Genre: Mappable {
    init?(map: Map) {
        self.init()
    }

    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}
