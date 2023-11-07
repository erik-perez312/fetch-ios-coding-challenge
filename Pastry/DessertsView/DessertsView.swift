//
//  DessertsView.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import SwiftUI

struct DessertsView<ViewModel: DessertsViewModelProtocol>: View {
    
    @StateObject
    var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            switch viewModel.state {
            case .loading, .initial:
                ProgressView()
                    .onAppear {
                        if viewModel.state == .initial {
                            viewModel.fetchDesserts()
                        }
                    }
            case .loaded:
                DessertsGridView(desserts: viewModel.desserts)
            case .error:
                ErrorRetryView {
                    viewModel.fetchDesserts()
                }
            }
        }
    }
}

#Preview("desserts") {
    DessertsView(
        viewModel: DessertsViewModelMock(
            desserts: DessertPreviewData.desserts,
            state: .loaded
        )
    )
}

#Preview("Error") {
    DessertsView(
        viewModel: DessertsViewModelMock(
            desserts: [],
            state: .error
        )
    )
}

#Preview("Initial/Loading") {
    DessertsView(
        viewModel: DessertsViewModelMock(
            desserts: [],
            state: .initial
        )
    )
}
