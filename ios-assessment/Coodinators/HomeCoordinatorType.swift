//
//  HomeCoordinatorType.swift
//  ios-assessment
//
//  Created by Nguyen Truong on 6/7/21.
//

import Foundation

protocol HomeCoordinatorType: Coordinator {
    var detailsCoordinator: DetailsCoordinatorType? { get set }

    func didTapMovie(_ movie: Movie)
}
