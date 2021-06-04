//
//  Language.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/4/21.
//

import Foundation
import ObjectMapper

struct Language {
    var name: String

    init() {
        name = ""
    }
}

extension Language: Mappable {
    init?(map: Map) {
        self.init()
    }

    mutating func mapping(map: Map) {
        name <- map["english_name"]
    }
}
