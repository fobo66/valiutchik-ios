//
//  LocationDataSource.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 3/13/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import MapboxGeocoder
import Combine

protocol LocationDataSourceProtocol {
    func resolveCity(lat: Double, lng: Double) -> Future <String, Never>
}

class LocationDataSource: LocationDataSourceProtocol {
    private let geocoder: Geocoder
    
    init(_ geocoder: Geocoder) {
        self.geocoder = geocoder
    }
    
    func resolveCity(lat: Double, lng: Double) -> Future <String, Never> {
        return Future() { promise in
            let options = ReverseGeocodeOptions(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng))
            options.allowedISOCountryCodes = ["BY"]
            options.locale = Locale(identifier: "ru")

            self.geocoder.geocode(options) { (placemarks, attribution, error) in
                guard let placemark = placemarks?.first else {
                    return
                }

               let city = placemark.postalAddress?.city ?? ""
                
                promise(Result.success(city))
            }
        }
    }
}
