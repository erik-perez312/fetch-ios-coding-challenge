//
//  DessertsViewModelMock.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import Foundation

class DessertsViewModelMock: DessertsViewModelProtocol {
    let desserts: [Dessert]
    
    @Published var state: ViewModelState
    
    func fetchDesserts() {
        // empty
    }
    
    init(desserts: [Dessert], state: ViewModelState) {
        self.desserts = desserts
        self.state = state
    }
}
