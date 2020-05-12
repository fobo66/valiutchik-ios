//
//  CurrenciesRepository.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 5/12/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import Foundation

class CurrenciesRepository {
    
    let currencyRatesDataSource: CurrencyRatesDataSource
    
    init(currencyRatesDataSource: CurrencyRatesDataSource) {
        self.currencyRatesDataSource = currencyRatesDataSource
    }
}
