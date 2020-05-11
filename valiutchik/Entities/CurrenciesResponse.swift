//
//  CurrenciewResponse.swift
//  valiutchik
//
//  Created by Andrei Mukamolau on 5/11/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import Foundation
import XMLMapper

struct CurrenciesResponse : XMLMappable {
    
    var currencies: [Currency]! = []
    
    
    init?(map: XMLMap) {
        
    }
    
    var nodeName: String!
    
    mutating func mapping(map: XMLMap) {
        currencies <- map["bank"]
    }
    
    
}
