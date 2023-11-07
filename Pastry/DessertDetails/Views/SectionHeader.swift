//
//  SectionHeader.swift
//  Pastry
//
//  Created by Erik Perez on 11/7/23.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .bold()
                .padding(.leading)
            Spacer()
        }
        .background(Color.gray.opacity(0.1))
        .padding(.bottom, 5)
    }
}

#Preview {
    SectionHeader(title: "Ingredients")
}
