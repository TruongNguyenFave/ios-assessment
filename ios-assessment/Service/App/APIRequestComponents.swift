//
//  APIRequestComponents.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/3/21.
//

import Foundation

class APIURL {

    private static let host = "http://api.themoviedb.org"

    static let apiVersion = "/3/"

    static let urlRoot = host + apiVersion

    // App
    static let movie = urlRoot + "discover/movie"
    static let movieDetails = urlRoot + "/movie/%d"
}
