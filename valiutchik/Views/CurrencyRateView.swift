//
//  CurrencyRateView.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 3/1/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import SwiftUI

struct CurrencyRateView: View {
    
    let currency: CurrencyLabel
    
    init(currency: CurrencyLabel) {
        self.currency = currency
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(self.currency.rawValue)
                    .bold()
                Spacer()
                Text("2.2")
            }.padding()
            Text("Deutsche Bank")
        }
    }
}

struct CurrencyRateView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyRateView(currency: .usd)
    }
}
