//
//  DependencyContainer.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 12/6/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import Foundation
import MapboxGeocoder

struct DependencyContainer {
    // MARK: - Datasources
    lazy var locationDataSource: LocationDataSourceProtocol = LocationDataSource(Geocoder.shared)
    lazy var currencyRatesDataSource: CurrencyRatesDataSourceProtocol = CurrencyRatesDataSource(baseUrl: "https://admin.myfin.by/outer/authXml")
    lazy var preferenceDataSource: PreferenceDataSourceProtocol = PreferenceDataSource(UserDefaults.standard)
    
    // MARK: - Repositories
    lazy var locationRepository = LocationRepository(locationDataSource)
    lazy var currencyRatesRepository = CurrenciesRepository(currencyRatesDataSource)
}
