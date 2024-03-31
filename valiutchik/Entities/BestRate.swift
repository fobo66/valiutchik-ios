//
//  BestRate.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 31.03.24.
//  Copyright © 2024 Andrei Mukamolau. All rights reserved.
//
import Foundation
import SwiftData

@Model
class BestRate: ObservableObject {
    @Attribute(.unique) var id: String = UUID().uuidString
    var bank: String
    var name: String
    var currency: CurrencyLabel
    var value: String
    var timestamp: Date
    var isBuy: Bool
    
    init(id: String = UUID().uuidString, bank: String, name: String, currency: CurrencyLabel, value: String, timestamp: Date, isBuy: Bool) {
        self.id = id
        self.bank = bank
        self.name = name
        self.currency = currency
        self.value = value
        self.timestamp = timestamp
        self.isBuy = isBuy
    }
}
