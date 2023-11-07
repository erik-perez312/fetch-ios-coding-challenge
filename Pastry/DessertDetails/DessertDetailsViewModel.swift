//
//  DessertDetailsViewModel.swift
//  Pastry
//
//  Created by Erik Perez on 11/7/23.
//

import Foundation

protocol DessertDetailsViewModelProtocol: ObservableObject {
    var dessertDetails: DessertDetails? { get }
    var state: ViewModelState { get }
    
    func fetchDetails()
}

class DessertDetailsViewModel: DessertDetailsViewModelProtocol {
    private let dessertID: String
    private(set) var dessertDetails: DessertDetails?
    
    @Published var state: ViewModelState = .initial
    
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient = NetworkClient(), dessertID: String) {
        self.networkClient = networkClient
        self.dessertID = dessertID
    }
    
    func fetchDetails() {
        networkClient.request(GetDessertDetailsNetworkRequest(dessertID: dessertID)) { [weak self] result in
            switch result {
            case .success(let details):
                self?.dessertDetails = details
                self?.state = .loaded
            case .failure:
                self?.state = .error
            }
        }
    }
}
