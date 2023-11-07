//
//  DetailsContentView.swift
//  Pastry
//
//  Created by Erik Perez on 11/7/23.
//

import SwiftUI

struct DetailsContentView: View {
    let details: DessertDetails
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                CachedAsyncImageView(url: details.imageURL)
                
                Section(header: SectionHeader(title: "Ingredients")) {
                    ForEach(details.ingredients, id: \.self) { ingredient in
                        HStack(alignment: .firstTextBaseline) {
                            Text(ingredient.name.uppercased())
                                .bold()
                            Spacer()
                            Text(ingredient.measurement)
                        }
                        .font(.body)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 10)
                    }
                }
                
                Section(header: SectionHeader(title: "Instuctions")) {
                    Text(details.instructions)
                        .padding(.horizontal)
                        .multilineTextAlignment(.leading)
                }
            }
            .navigationTitle(details.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        DetailsContentView(details: DessertPreviewData.appleCrumbleDetails)
    }
}
