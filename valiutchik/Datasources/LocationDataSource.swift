//
//  LocationDataSource.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 3/13/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import MapboxGeocoder

protocol LocationDataSourceProtocol {
    func resolveCity(lat: Double, lng: Double)
}

class LocationDataSource: LocationDataSourceProtocol {
    func resolveCity(lat: Double, lng: Double) {
        
    }
}
