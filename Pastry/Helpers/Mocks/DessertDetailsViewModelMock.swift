//
//  DessertDetailsViewModelMock.swift
//  Pastry
//
//  Created by Erik Perez on 11/7/23.
//

import Foundation

class DessertDetailsViewModelMock: DessertDetailsViewModelProtocol {
    var dessertDetails: DessertDetails?
    
    @Published var state: ViewModelState
    
    func fetchDetails() {
        // empty
    }
    
    init(dessertDetails: DessertDetails?, state: ViewModelState) {
        self.dessertDetails = dessertDetails
        self.state = state
    }
}
