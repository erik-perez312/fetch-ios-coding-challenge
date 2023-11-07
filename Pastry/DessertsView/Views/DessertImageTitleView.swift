//
//  DessertImageTitleView.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import SwiftUI

struct DessertImageTitleView: View {
    let dessert: Dessert
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: dessert.thumbnail)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .foregroundStyle(Color.gray)
                case .success(let image):
                    image
                        .resizable()
                @unknown default:
                    Image(systemName: "photo")
                        .resizable()
                        .foregroundStyle(Color.gray)
                }
            }
                
            VStack {
                Spacer()
                Text(dessert.name)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(3)
                    .background(Color.black.opacity(0.8).cornerRadius(5))
                    .padding(.horizontal, 3)
                    .padding(.bottom, 3)
            }
        }
    }
}

private let dessert = Dessert(id: "1", name: "Chocolate", thumbnail: ".")

#Preview("Dessert Cell", traits: .fixedLayout(width: 200, height: 200)) {
    DessertImageTitleView(dessert: DessertPreviewData.desserts.first ?? dessert)
        .frame(width: 200, height: 200)
}
