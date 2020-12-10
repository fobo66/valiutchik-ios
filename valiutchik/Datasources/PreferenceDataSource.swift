//
//  PreferenceDataSource.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 12/6/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import Foundation

protocol PreferenceDataSourceProtocol {
    func loadString(for key: String) -> String
    func saveString(key: String, value: String)
}

class PreferenceDataSource: PreferenceDataSourceProtocol {
    private let userDefaults: UserDefaults

    init(_ userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    func loadString(for key: String) -> String {
        return userDefaults.string(forKey: key) ?? ""
    }

    func saveString(key: String, value: String) {
        userDefaults.setValue(value, forKey: key)
    }
}
