//
//  CurrencyRatesDataSource.swift
//  
//
//  Created by Andrei Mukamolau on 3/5/20.
//

import Foundation

protocol CurrencyRatesDataSource {
    func fetchCourses(city: String) -> [CurrencyLabel]
}

class MyfinDataSource: CurrencyRatesDataSource {
    func fetchCourses(city: String) -> [CurrencyLabel] {
        return []
    }
}
