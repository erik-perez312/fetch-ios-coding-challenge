//
//  JSONLoader.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import Foundation

struct JSONLoader {
    
    static func loadJSONData(from file: JSONFile) -> Data? {
        guard let path = Bundle.main.path(forResource: file.rawValue, ofType: "json") else {
            return nil
        }
        
        return try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
}
