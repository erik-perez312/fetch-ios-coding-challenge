//
//  MealAsyncImageView.swift
//  Pastry
//
//  Created by Erik Perez on 11/7/23.
//

import SwiftUI

struct CachedAsyncImageView: View {
    let url: String
    
    @StateObject var imageManager = ImageManager()
    
    var body: some View {
        ZStack {
            switch imageManager.state {
            case .downloading:
                ProgressView()
            case .error:
                PlaceholderImage()
            case .loaded(let data):
                if let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    PlaceholderImage()
                }
            }
        }
        .task {
            imageManager.getImageData(url)
        }
    }
}

#Preview("Valid Image") {
    let url = DessertPreviewData.appleCrumbleImageURL?.absoluteString ?? ""
    
    return CachedAsyncImageView(url: url)
}

#Preview("Invalid Image") {
    CachedAsyncImageView(url: "")
}
