//
//  DessertDetails.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import Foundation

struct DessertDetails: Hashable {
    let id: String
    let instructions: String
    let imageURL: String
    let name: String
}

extension DessertDetails: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case instructions = "strInstructions"
        case imageURL = "strMealThumb"
        case name = "strMeal"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        instructions = try container.decode(String.self, forKey: .instructions)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        name = try container.decode(String.self, forKey: .name)
    }
}
