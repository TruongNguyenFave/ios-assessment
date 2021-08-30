//
//  HasDisposeBag.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/7/21.
//

import Foundation
import RxSwift

protocol HasDisposeBag {
    var disposeBag: DisposeBag { get set }
}
