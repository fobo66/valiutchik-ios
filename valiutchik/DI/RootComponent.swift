//
//  RootComponent.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 31.03.24.
//  Copyright © 2024 Andrei Mukamolau. All rights reserved.
//
import NeedleFoundation
import SwiftUI
import TomTomSDKReverseGeocoder
import TomTomSDKReverseGeocoderOnline

class RootComponent: BootstrapComponent {
    var userDefaults: UserDefaults {
        UserDefaults.standard
    }

    var reverseGeocoder: TomTomSDKReverseGeocoder.ReverseGeocoder? {
        try? OnlineReverseGeocoderFactory.create(apiKey: userDefaults.string(forKey: "TTTomTomAccessToken") ?? ""
        )
    }

    var preferenceDataSource: PreferenceDataSourceProtocol {
        PreferenceDataSource(userDefaults)
    }
}
