//
//  ImageCache.swift
//  Pastry
//
//  Created by Erik Perez on 11/7/23.
//

import Foundation

class ImageCache {
    private let cache: NSCache<NSString, NSData> = {
        let newCache = NSCache<NSString, NSData>()
        newCache.countLimit = 100
        return newCache
    }()
    
    static let shared = ImageCache()
    
    private init() {}
    
    func setImage(_ imageData: Data, forKey key: String) {
        cache.setObject(imageData as NSData, forKey: key as NSString)
    }
    
    func getImage(forKey key: String) -> Data? {
        cache.object(forKey: key as NSString) as? Data
    }
}
