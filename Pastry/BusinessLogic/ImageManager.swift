//
//  ImageManager.swift
//  Pastry
//
//  Created by Erik Perez on 11/7/23.
//

import Foundation

/// Lightweight image manager with cache support.
class ImageManager: ObservableObject {
    let networkClient: NetworkClientProtocol
    let imageCache: ImageCache
    
    @Published var state: ImageState = .downloading
    
    init(networkClient: NetworkClientProtocol = NetworkClient(), 
         imageCache: ImageCache = .shared) {
        self.networkClient = networkClient
        self.imageCache = imageCache
    }
    
    func getImageData(_ url: String) {
        // Check if url is for local image
        if let url = URL(string: url),
           (url.scheme ?? "" ) == "file",
           let data = try? Data.init(contentsOf: url) {
            
            imageCache.setImage(data, forKey: url.absoluteString)
            state = .loaded(data: data)
            return
        }
        
        guard let cachedImageData = imageCache.getImage(forKey: url) else {
            downloadImageData(url)
            return
        }
        
        state = .loaded(data: cachedImageData)
    }
    
    private func downloadImageData(_ url: String) {
        networkClient.request(GetImageDataNetworkRequest(imageURL: url)) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self?.imageCache.setImage(data, forKey: url)
                    self?.state = .loaded(data: data)
                case .failure:
                    self?.state = .error
                }
            }
        }
    }
}

extension ImageManager {
    
    enum ImageState {
        case downloading
        case loaded(data: Data)
        case error
    }
}
