//
//  NetworkClientMock.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import Foundation

class NetworkClientMock: NetworkClientProtocol {
    
    @discardableResult
    func request<Request: NetworkRequestable>(
        _ request: Request,
        completionHandler: @escaping (Result<Request.Response, Error>) -> Void
    ) -> URLSessionDataTask?
    {
        var data: Data?
        
        switch request {
        case is GetDessertDetailsNetworkRequest:
            data = JSONLoader.loadJSONData(from: .dessertDetails)
        case is GetDessertListNetworkRequest:
            data = JSONLoader.loadJSONData(from: .dessertsList)
        default:
            break
        }
        
        guard let data = data else {
            assertionFailure("Failed to load JSON file data")
            return nil
        }
        
        completionHandler(request.decode(data))
        return nil
    }
}
