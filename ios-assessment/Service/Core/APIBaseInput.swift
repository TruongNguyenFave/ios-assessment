//
//  APIBaseInput.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import Alamofire

class APIBaseInput {

    var urlString: String
    var urlParams: [String : Any]?
    let method: HTTPMethod
    var parameters: [String : Any]?
    var headers: HTTPHeaders = [:]
    var encoding: ParameterEncoding
    let headersType: APIHeadersType

    init(urlString: String,
         method: HTTPMethod,
         parameters: [String : Any]?,
         urlParams: [String : Any]? = nil,
         encoding: ParameterEncoding? = JSONEncoding.default,
         headersType: APIHeadersType) {
        self.urlString = urlString
        self.method = method
        self.parameters = parameters
        if let encoding = encoding {
            self.encoding = encoding
        } else {
            self.encoding = method == .get ? URLEncoding.default : JSONEncoding(options: [])
        }
        self.urlParams = urlParams
        self.headersType = headersType
    }

    var url: URL? {
        return URL(string: urlString)
    }
}
