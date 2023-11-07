//
//  JSONLoaderTests.swift
//  PastryTests
//
//  Created by Erik Perez on 11/6/23.
//

import XCTest
@testable import Pastry

final class Fetch_first_draftTests: XCTestCase {
    func testCanLoadJSONFile() {
        let data = JSONLoader.loadJSONData(from: .dessertsList)
        XCTAssertNotNil(data)
    }
}
