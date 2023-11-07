//
//  NetworkClient.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import Foundation

enum HTTPMethod: String {
    // Only using get
    case get = "GET"
}

enum Scheme: String {
    case https
}

enum NetworkError: Error {
    case decodingError(message: String)
    case requestFailed(message: String)
    case invalidURL
    case invalidResponse
}

protocol NetworkClientProtocol {
    @discardableResult
    func request<Request: NetworkRequestable>(
        _ request: Request,
        completionHandler: @escaping (Result<Request.Response, Error>) -> Void
    ) -> URLSessionDataTask?
}

class NetworkClient: NetworkClientProtocol {
    
    @discardableResult
    func request<Request: NetworkRequestable>(
        _ request: Request,
        completionHandler: @escaping (Result<Request.Response, Error>) -> Void
    ) -> URLSessionDataTask?
    {
        var components = URLComponents()
        components.scheme = request.scheme.rawValue
        components.host = request.urlDomain
        components.path = request.urlPath
        components.queryItems = request.parameters
        
        guard let url = components.url else {
            completionHandler(.failure(NetworkError.invalidURL))
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod.rawValue
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completionHandler(.failure(NetworkError.requestFailed(message: error.localizedDescription)))
                    return
                }
                
                guard let data = data else {
                    completionHandler(.failure(NetworkError.invalidResponse))
                    return
                }
                
                completionHandler(request.decode(data))
            }
        }
        
        task.resume()
        
        return task
    }
}
