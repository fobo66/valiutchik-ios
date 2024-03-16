//
//  DependencyContainer.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 12/6/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import Foundation
import TomTomSDKCommon
import TomTomSDKReverseGeocoder
import TomTomSDKReverseGeocoderOnline

struct DependencyContainer {
    // MARK: - Dependencies
    lazy var reverseGeocoderApi = try? OnlineReverseGeocoderFactory.create(apiKey: UserDefaults.standard.string(forKey: "TTTomTomAccessToken") ?? ""
    )
    
    // MARK: - Datasources
    lazy var locationDataSource: LocationDataSourceProtocol = LocationDataSource(
        geocoder: reverseGeocoderApi
    )
    lazy var currencyRatesDataSource: CurrencyRatesDataSourceProtocol = CurrencyRatesDataSource(baseUrl: "https://admin.myfin.by/outer/authXml")
    lazy var preferenceDataSource: PreferenceDataSourceProtocol = PreferenceDataSource(UserDefaults.standard)
    
    // MARK: - Repositories
    lazy var locationRepository = LocationRepository(locationDataSource)
    lazy var currencyRatesRepository = CurrenciesRepository(currencyRatesDataSource)
}
