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
        HStack {
            VStack(alignment: .leading) {
                Text(self.currency.rawValue)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .bold()
                Text("2.2")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .padding([.vertical])
                Label("Deutsche Bank", systemImage: "building.columns.fill")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
            Spacer()
        }
        .cornerRadius(10)
        .padding([.top, .horizontal])
        .contextMenu(/*@START_MENU_TOKEN@*/ContextMenu(menuItems: {
            Button(action: {}) {
                Text("action_copy")
            }
            Button(action: {}) {
                Text("action_open_map")
            }
        })/*@END_MENU_TOKEN@*/)
    }
}

struct CurrencyRateView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyRateView(currency: .usd)
    }
}
