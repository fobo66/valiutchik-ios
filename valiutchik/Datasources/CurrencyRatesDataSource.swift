//
//  CurrencyRatesDataSource.swift
//  
//
//  Created by Andrei Mukamolau on 3/5/20.
//

import Alamofire
import Combine

class CurrencyRatesDataSource {
    
    @Published var currencies = [Currency]()
    
    private let baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
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
        
        request(url)
            .authenticate(user: "app", password: "android")
            .responseXMLObject(queue: DispatchQueue.global(qos: .background)) { (response: DataResponse<CurrenciesResponse>) in
                let currencies = response.result.value?.currencies ?? []
            
            currencies
                .filter { $0.isValid() }
                .forEach { self.currencies.append($0) }
        }
    }
    
    private func resolveUrl(city: String) -> String {
        let cityEndpoint = citiesMap[city] ?? "1"
        
        return baseUrl + cityEndpoint
    }
}
