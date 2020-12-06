//
//  CurrenciesRepository.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 5/12/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import Foundation
import Combine

class CurrenciesRepository {
    
    private let currencyRatesDataSource: CurrencyRatesDataSourceProtocol
    
    init(_ currencyRatesDataSource: CurrencyRatesDataSourceProtocol) {
        self.currencyRatesDataSource = currencyRatesDataSource
    }
    
    func fetchCourses(city: String) -> AnyPublisher<Currency, Never> {
        return self.currencyRatesDataSource.fetchCourses(city: city)
            .flatMap { $0.publisher }
            .filter { $0.isValid() }
            .eraseToAnyPublisher()
    }
}
