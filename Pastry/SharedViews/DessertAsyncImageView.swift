//
//  MealAsyncImageView.swift
//  Pastry
//
//  Created by Erik Perez on 11/7/23.
//

import SwiftUI

struct DessertAsyncImageView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .failure:
                PlaceholderImage()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            @unknown default:
                PlaceholderImage()
            }
        }
    }
}

#Preview {
    DessertAsyncImageView(url: DessertPreviewData.appleCrumbleImageURL)
}
