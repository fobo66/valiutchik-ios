//
//  LocationDataSource.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 3/13/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import Combine
import CoreLocation
import Foundation
import TomTomSDKCommon
import TomTomSDKReverseGeocoder
import TomTomSDKReverseGeocoderOnline

protocol LocationDataSourceProtocol {
    func resolveCity(lat: Double, lng: Double) -> Future<String, Never>
}

class LocationDataSource: LocationDataSourceProtocol {
    private let geocoder: TomTomSDKReverseGeocoder.ReverseGeocoder?

    init(_ geocoder: TomTomSDKReverseGeocoder.ReverseGeocoder?) {
        self.geocoder = geocoder
    }

    func resolveCity(lat: Double, lng: Double) -> Future<String, Never> {
        return Future { promise in
            guard let geocoder = self.geocoder else { return }
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
            let options = ReverseGeocoderOptions(
                position: coordinate,
                locale: Locale(identifier: "ru")
            )

            geocoder.reverseGeocode(options: options) { result in
                guard case let .success(response) = result,
                      let address = response.places.first?.place.address else { return }
                let city = address.countrySecondarySubdivision ?? ""
                promise(Result.success(city))
            }
        }
    }
}
