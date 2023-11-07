//
//  GetDessertListRequestTests.swift
//  PastryTests
//
//  Created by Erik Perez on 11/6/23.
//

import XCTest
@testable import Pastry

final class GetDessertListRequestTests: XCTestCase {
    
    func testParsingDessertList() {
        let networkClient = NetworkClientMock()
        
        networkClient.request(GetDessertListNetworkRequest()) { result in
            switch result {
            case .success(let response):
                XCTAssertTrue(!response.meals.isEmpty)
            case .failure:
                XCTFail("Decoding failed")
            }
        }
    }
}
