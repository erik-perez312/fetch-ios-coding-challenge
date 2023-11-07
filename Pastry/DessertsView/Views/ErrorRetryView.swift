//
//  ErrorRetryView.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import SwiftUI

struct ErrorRetryView: View {
    var onRetry: () -> Void
    
    var body: some View {
        VStack {
            Text("Oops! Something went wrong. Please try again")
                .multilineTextAlignment(.center)
                .font(.title2)
            Button("Retry") {
                onRetry()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ErrorRetryView(onRetry: { })
}
