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
    
    init?(map: XMLMap) {
       
    }
    
    var nodeName: String! = "bank"
    
    mutating func mapping(map: XMLMap) {
        
    }
    

}
