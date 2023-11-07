//
//  PlaceholderImage.swift
//  Pastry
//
//  Created by Erik Perez on 11/7/23.
//

import SwiftUI

struct PlaceholderImage: View {
    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .padding(10)
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.gray)
    }
}

#Preview {
    PlaceholderImage()
}
