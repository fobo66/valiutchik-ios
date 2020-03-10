//
//  CurrencyRatesDataSource.swift
//  
//
//  Created by Andrei Mukamolau on 3/5/20.
//

import Alamofire

protocol CurrencyRatesDataSource {
    func fetchCourses(city: String)
}

class MyfinDataSource: CurrencyRatesDataSource {
    
    private let citiesMap = [
        "Минск": "1",
        "Витебск": "2",
        "Гомель": "3",
        "Гродно": "4",
        "Брест": "5",
        "Могилёв": "6"
    ]
    
    func fetchCourses(city: String) {
        
        let url = resolveUrl(city: city)
        request(url).responseXMLArray(queue: DispatchQueue.global(), keyPath: "root") { (response: DataResponse<[Currency]>) in
            let currencies = response.result.value
        }
    }
    
    private func resolveUrl(city: String) -> String {
        let cityEndpoint = citiesMap[city] ?? "1"
        
        return "https://admin.myfin.by/outer/authXml/" + cityEndpoint
    }
}
