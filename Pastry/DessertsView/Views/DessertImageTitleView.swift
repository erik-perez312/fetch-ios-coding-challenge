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
            CachedAsyncImageView(url: dessert.thumbnail)
                
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

#Preview("Dessert Cell", traits: .fixedLayout(width: 200, height: 200)) {
    let dessert = Dessert(id: "1", name: "Chocolate", thumbnail: ".")
    
    return DessertImageTitleView(dessert: DessertPreviewData.desserts.first ?? dessert)
        .frame(width: 200, height: 200)
}
