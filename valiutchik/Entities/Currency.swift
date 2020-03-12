//
//  Currency.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 3/9/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import Foundation
import XMLMapper

struct Currency: XMLMappable {
    
    var bankname: String = ""
    var usdBuy: String = ""
    var usdSell: String = ""
    var eurBuy: String = ""
    var eurSell: String = ""
    var rurBuy: String = ""
    var rurSell: String = ""
    
    init?(map: XMLMap) {
       
    }
    
    var nodeName: String! = "bank"
    
    mutating func mapping(map: XMLMap) {
        bankname <- map["bankname"]
        usdBuy <- map["usd_buy"]
        usdSell <- map["usd_sell"]
        eurBuy <- map["eur_buy"]
        eurSell <- map["eur_sell"]
        rurBuy <- map["rur_buy"]
        rurSell <- map["rur_sell"]
    }
    

}

extension Currency {
    func isValid() -> Bool {
        return isValidRate(rate: usdBuy) &&
        isValidRate(rate: usdSell) &&
        isValidRate(rate: eurBuy) &&
        isValidRate(rate: eurSell) &&
        isValidRate(rate: rurBuy) &&
        isValidRate(rate: rurSell)
    }
    
    private func isValidRate(rate: String) -> Bool {
        !rate.isEmpty && !(rate == "-")
    }
}
