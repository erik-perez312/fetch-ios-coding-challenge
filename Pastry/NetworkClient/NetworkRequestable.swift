//
//  NetworkRequestable.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import Foundation

protocol NetworkRequestable {
    associatedtype Response: Codable
    
    var httpMethod: HTTPMethod { get }
    var parameters: [URLQueryItem]? { get }
    var scheme: Scheme { get }
    var urlDomain: String { get }
    var urlPath: String { get }
    
    func decode(_ data: Data) -> Result<Response, Error>
}

extension NetworkRequestable {
    
    var parameters: [URLQueryItem]? {
        nil
    }
    
    var scheme: Scheme {
        .https
    }
    
    var urlDomain: String {
        "themealdb.com"
    }
    
    func decode(_ data: Data) -> Result<Response, Error> {
        do {
            let response = try JSONDecoder().decode(Response.self, from: data)
            return .success(response)
        } catch {
            return .failure(NetworkError.decodingError(message: error.localizedDescription))
        }
    }
}
