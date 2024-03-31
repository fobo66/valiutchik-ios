//
//  LocationRepository.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 5/12/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import Combine
import Foundation

class LocationRepository {
    private let locationDataSource: LocationDataSourceProtocol

    init(_ locationDataSource: LocationDataSourceProtocol) {
        self.locationDataSource = locationDataSource
    }

    func resolveCity(lat: Double, lng: Double) -> AnyPublisher<String, Never> {
        return locationDataSource.resolveCity(lat: lat, lng: lng)
            .eraseToAnyPublisher()
    }
}
