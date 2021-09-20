//
//  CurrencyRatesDataSource.swift
//
//
//  Created by Andrei Mukamolau on 3/5/20.
//

import Alamofire
import Combine

protocol CurrencyRatesDataSourceProtocol {
    func fetchCourses(city: String) -> Future<[Currency], Never>
}

class CurrencyRatesDataSource: CurrencyRatesDataSourceProtocol {
    private let baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    private lazy var citiesMap = [
        "Минск": "1",
        "Витебск": "2",
        "Гомель": "3",
        "Гродно": "4",
        "Брест": "5",
        "Могилёв": "6"
    ]
    
    func fetchCourses(city: String) -> Future<[Currency], Never> {
        return Future { promise in
            let url = self.resolveUrl(city: city)
            
            AF.request(url)
                .authenticate(username: "app", password: "android")
                .responseXMLObject(queue: DispatchQueue.global(qos: .background)) { (response: DataResponse<CurrenciesResponse, AFError>) in
                    let currencies = response.value?.currencies ?? []
                    promise(Swift.Result.success(currencies))
                }
        }
    }
    
    private func resolveUrl(city: String) -> String {
        let cityEndpoint = citiesMap[city] ?? "1"
        
        return baseUrl + cityEndpoint
    }
}
