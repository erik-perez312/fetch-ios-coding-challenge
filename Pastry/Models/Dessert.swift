//
//  Dessert.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import Foundation

struct Dessert: Hashable {
    let id: String
    let name: String
    let thumbnail: String
}

extension Dessert: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
    }
}
