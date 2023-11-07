//
//  GetImageDataNetworkRequest.swift
//  Pastry
//
//  Created by Erik Perez on 11/7/23.
//

import Foundation

struct GetImageDataNetworkRequest: NetworkRequestable {
    
    typealias Response = Data
    
    let urlComponents: URLComponents?
    
    init(imageURL: String) {
        self.urlComponents = URLComponents(string: imageURL)
    }
    
    var httpMethod: HTTPMethod = .get
    
    var urlPath: String {
        urlComponents?.path ?? ""
    }
    
    func decode(_ data: Data) -> Result<Data, Error> {
        .success(data)
    }
}
