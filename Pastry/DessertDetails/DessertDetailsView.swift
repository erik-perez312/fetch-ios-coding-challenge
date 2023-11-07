//
//  DessertDetailsView.swift
//  Pastry
//
//  Created by Erik Perez on 11/7/23.
//

import SwiftUI

struct DessertDetailsView<ViewModel: DessertDetailsViewModelProtocol> : View {
    
    @StateObject
    var viewModel: ViewModel
    
    var body: some View {
        switch viewModel.state {
        case .loading, .initial:
            ProgressView()
                .onAppear {
                    if viewModel.state == .initial {
                        viewModel.fetchDetails()
                    }
                }
        case .loaded:
            if let details = viewModel.dessertDetails {
                DetailsContentView(details: details)
            }
        case .error:
            ErrorRetryView {
                viewModel.fetchDetails()
            }
        }
    }
}

#Preview("Loaded") {
    let mockViewModel = DessertDetailsViewModelMock(
        dessertDetails: DessertPreviewData.appleCrumbleDetails,
        state: .loaded)
    
    return DessertDetailsView(viewModel: mockViewModel)
}

#Preview("Loading/Initial") {
    let mockViewModel = DessertDetailsViewModelMock(
        dessertDetails: nil,
        state: .loading)
    
    return DessertDetailsView(viewModel: mockViewModel)
}

#Preview("Error") {
    let mockViewModel = DessertDetailsViewModelMock(
        dessertDetails: nil,
        state: .error)
    
    return DessertDetailsView(viewModel: mockViewModel)
}
