//
//  CurrencyRateView.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 3/1/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import SwiftUI

struct CurrencyRateView: View {
    
    let currency: Currency
    
    init(currency: Currency) {
        self.currency = currency
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CurrencyRateView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyRateView(currency: .usd)
    }
}
