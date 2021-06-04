//
//  APIService.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift
import RxAlamofire

protocol APIServiceType {

    func request<T: Mappable>(_ input: APIBaseInput) -> Observable<T>

}

typealias JSONDictionary = [String: Any]

final class APIService: APIServiceType {

    static let shared = APIService()

    func request<T: Mappable>(_ input: APIBaseInput) -> Observable<T> {
        return request(input)
            .map { json -> T in
                if let output = T(JSON: json) {
                    return output
                }
                throw APIResponseError.invalidResponseData
        }
    }

}

// MARK: - Implemement methods
extension APIService {
    fileprivate func request(_ input: APIBaseInput) -> Observable<JSONDictionary> {
        let urlRequest = preprocessInput(input)
            .do(onNext: { input in
                print("====================URL====================")
                print(input.urlString)
                print("====================Header=================")
                print(input.headers)
                print("====================Parameters=============")
                print(input.parameters ?? "")

            })
            .flatMapLatest { input in
                Alamofire.Session.default.rx
                    .request(input.method,
                             input.urlString,
                             parameters: input.parameters,
                             encoding: input.encoding,
                             headers: input.headers)
        }
        .flatMapLatest { dataRequest -> Observable<(HTTPURLResponse, Data)> in
            return dataRequest
                    .rx.responseData()
        }
        .map { (dataResponse) -> JSONDictionary in
            return try self.process(dataResponse, url: input.url)
        }

        return urlRequest
    }

    fileprivate func process(_ response: (HTTPURLResponse, Data), url: URL?) throws -> JSONDictionary {
        let (response, data) = response
        var error: Error = APIResponseError.invalidResponseData
        switch response.statusCode {
        case 200..<300:
            if let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? JSONDictionary {
                print("👍 [\(response.statusCode)] " + (response.url?.absoluteString ?? ""))
                return json
            } else {
                error = APIResponseError.invalidResponseData
            }
        default:
            if let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? JSONDictionary {
                print("❌ [\(response.statusCode)] " + (response.url?.absoluteString ?? ""))
                return json
            } else {
                error = APIResponseError.unknown(statusCode: response.statusCode)
            }
        }
        print("❌ [\(response.statusCode)] " + (response.url?.absoluteString ?? ""))
        throw error
    }

    fileprivate func preprocessInput(_ input: APIBaseInput) -> Observable<APIBaseInput> {
        return Observable.deferred {
            // Url params
            if let urlParams = input.urlParams, !urlParams.keys.isEmpty {
                var urlString = input.urlString + "?"
                for (index, key) in Array(urlParams.keys).enumerated() {
                    if let value = urlParams[key] {
                        urlString += "\(key)" + "=" + "\(value)"
                        if index < urlParams.keys.count - 1 {
                            urlString += "&"
                        }
                    }
                }
                input.urlString = urlString
            }
            return Observable.just(input)
        }
    }
}
