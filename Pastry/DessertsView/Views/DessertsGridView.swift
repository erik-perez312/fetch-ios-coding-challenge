//
//  DessertsGridView.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import SwiftUI

struct DessertsGridView: View {
    let desserts: [Dessert]
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                let size: CGFloat = proxy.size.width/2
                let gridItem = GridItem(.fixed(size), spacing: 0)
                
                LazyVGrid(columns: [gridItem, gridItem],
                          spacing: 0) {
                    ForEach(desserts, id: \.id) { dessert in
                        NavigationLink(value: dessert) {
                            DessertImageTitleView(dessert: dessert)
                                .frame(width: size, height: size)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Desserts")
            .navigationDestination(for: Dessert.self) { dessert in
                // TODO: Implement
                EmptyView()
            }
        }
    }
}

#Preview("Desserts Grid View") {
    DessertsGridView(desserts: DessertPreviewData.desserts)
}
