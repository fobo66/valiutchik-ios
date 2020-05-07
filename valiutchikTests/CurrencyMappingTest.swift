//
//  CurrencyMappingTest.swift
//  valiutchikTests
//
//  Created by Andrei Mukamolau on 5/7/20.
//  Copyright © 2020 Andrei Mukamolau. All rights reserved.
//

import XCTest
import XMLMapper

class CurrencyMappingTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFileMapping() throws {
        let bundle = Bundle(for: type(of: self))

        guard let url = bundle.url(forResource: "singleCurrency", withExtension: "xml") else {
            XCTFail("Missing file with test data: singleCurrency.xml")
            return
        }
        
        let xml = try String(contentsOf: url)
        
        let parsedXml = XMLMapper<Currency>().map(XMLString: xml)
        
        XCTAssert(parsedXml != nil)
        XCTAssert(parsedXml?.eurBuy == "2.026")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
