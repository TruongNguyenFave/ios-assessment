//
//  APIHeaders.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import Alamofire

enum APIHeadersType {

    case normal

    var headers: HTTPHeaders {
        var headers: HTTPHeaders = [:]
        switch self {
        case .normal:
            headers["Content-Type"] = "application/json"
        }
        return headers
    }
}
