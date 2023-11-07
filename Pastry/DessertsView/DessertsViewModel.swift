//
//  DessertsViewModel.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import Foundation

protocol DessertsViewModelProtocol: ObservableObject {
    var desserts: [Dessert] { get }
    var state: ViewModelState { get }
    
    func fetchDesserts()
}

class DessertsViewModel: ObservableObject, DessertsViewModelProtocol {
    
    let networkClient: NetworkClientProtocol
    private(set) var desserts = [Dessert]()
    
    @Published private(set) var state: ViewModelState = .initial
    
    init(networkClient: NetworkClientProtocol = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    func fetchDesserts() {
        state = .loading
        
        networkClient.request(GetDessertListNetworkRequest()) { [weak self] result in
            switch result {
            case .success(let listResponse):
                self?.desserts = listResponse.meals.sorted { $0.name < $1.name }
                self?.state = .loaded
            case .failure:
                self?.state = .error
            }
        }
    }
}
