//
//  LocationDataSource.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 3/13/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import MapboxGeocoder
import Combine

class LocationDataSource {
    
    @Published var city = ""
    
    private let geocoder: Geocoder
    
    init(geocoder: Geocoder) {
        self.geocoder = geocoder
    }
    
    func resolveCity(lat: Double, lng: Double) {
        let options = ReverseGeocodeOptions(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng))
        options.allowedISOCountryCodes = ["BY"]
        options.locale = Locale(identifier: "ru")

        geocoder.geocode(options) { (placemarks, attribution, error) in
            guard let placemark = placemarks?.first else {
                return
            }

            self.city = placemark.postalAddress?.city ?? ""
        }
        
    }
}
