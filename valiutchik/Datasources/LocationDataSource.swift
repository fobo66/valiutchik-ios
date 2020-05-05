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
    
    @Published var city = ""
    
    private let geocoder: Geocoder
    
    init(geocoder: Geocoder) {
        self.geocoder = geocoder
    }
    
    func resolveCity(lat: Double, lng: Double) {
        let options = ReverseGeocodeOptions(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng))

        geocoder.geocode(options) { (placemarks, attribution, error) in
            guard let placemark = placemarks?.first else {
                return
            }

            self.city = placemark.postalAddress?.city ?? ""
        }
        
    }
}
