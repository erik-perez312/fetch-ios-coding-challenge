//
//  GetDessertDetailsRequestTests.swift
//  PastryTests
//
//  Created by Erik Perez on 11/6/23.
//

import XCTest
@testable import Pastry

final class GetDessertDetailsRequestTests: XCTestCase {
    
    func testParsingDessertDetails() {
        let networkClient = NetworkClientMock()
        
        networkClient.request(GetDessertDetailsNetworkRequest(dessertID: "")) { result in
            switch result {
            case .success(let response):
                XCTAssertTrue(!response.ingredients.isEmpty)
            case .failure:
                XCTFail("Decoding failed")
            }
        }
    }
}
