//
//  CurrencyRatesDataSource.swift
//  
//
//  Created by Andrei Mukamolau on 3/5/20.
//

import Foundation

protocol CurrencyRatesDataSource {
    func fetchCourses(city: String) -> [Currency]
}

class MyfinDataSource: CurrencyRatesDataSource {
    func fetchCourses(city: String) -> [Currency] {
        return []
    }
}
