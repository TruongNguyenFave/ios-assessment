//
//  APIBaseOutput.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import ObjectMapper

class APIBaseOutput: Mappable {

    var code: Int = 0
    var success: Bool = false
    var message: String = ""

    init() {

    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        code <- map["status_code"]
        success <- map["ok"]
        message <- map["status_message"]
    }

    var errorMessageDisplaying: String {
        return message
    }
}
