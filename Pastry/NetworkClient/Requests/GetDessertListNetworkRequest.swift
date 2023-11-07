//
//  GetDessertListNetworkRequest.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import Foundation

struct GetDessertListNetworkRequest: NetworkRequestable {
    
    typealias Response = DessertListResponse
    
    let httpMethod: HTTPMethod = .get
    
    var parameters: [URLQueryItem]? = [
        .init(name: "c", value: "dessert")
    ]
    
    let urlPath: String = "/api/json/v1/1/filter.php"
    
    struct DessertListResponse: Codable {
        let meals: [Dessert]
    }
}
