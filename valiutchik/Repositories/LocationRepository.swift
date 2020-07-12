//
//  LocationRepository.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 5/12/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import Foundation
import Combine

class LocationRepository {
    private let locationDataSource: LocationDataSourceProtocol
    
    init(locationDataSource: LocationDataSourceProtocol) {
        self.locationDataSource = locationDataSource
    }
    
    func resolveCity(lat: Double, lng: Double) -> AnyPublisher<String, Never> {
        return self.locationDataSource.resolveCity(lat: lat, lng: lng)
            .eraseToAnyPublisher()
    }
}
