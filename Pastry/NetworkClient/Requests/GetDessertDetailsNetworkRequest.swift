//
//  GetDessertDetailsNetworkRequest.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import Foundation

struct GetDessertDetailsNetworkRequest: NetworkRequestable {
    typealias Response = DessertDetails
    
    let dessertID: String
    let httpMethod: HTTPMethod = .get
    
    var parameters: [URLQueryItem]? {
        [
            .init(name: "i", value: dessertID)
        ]
    }
    
    var urlPath: String {
        "/api/json/v1/1/lookup.php"
    }
    
    init(dessertID: String) {
        self.dessertID = dessertID
    }
    
    func decode(_ data: Data) -> Result<DessertDetails, Error> {
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            
            guard let desserts = json?["meals"] as? [[String: Any]],
                  var detailsJSON = desserts.first else {
                return .failure(NetworkError.invalidResponse)
            }
            
            detailsJSON["ingredients"] = createIngredientsMap(detailsJSON)
            
            let finalData = try JSONSerialization.data(withJSONObject: detailsJSON)
            let mealDetails = try JSONDecoder().decode(DessertDetails.self, from: finalData)
            
            return .success(mealDetails)
        } catch {
            return .failure(NetworkError.decodingError(message: error.localizedDescription))
        }
    }
    
    private func createIngredientsMap(_ dict: [String: Any]) -> [[String: String]] {
        var ingredients = [[String: String]]()
        
        for i in 1...20 {
            let ingredientKey = "strIngredient\(i)"
            let measureKey = "strMeasure\(i)"
            
            guard let ingredientName = dict[ingredientKey] as? String,
                  let measurement = dict[measureKey] as? String,
                  !ingredientName.isEmpty,
                  !measurement.isEmpty else {
                break
            }
            
            let existingIngredient = ingredients.first(where: { $0["name"] == ingredientName })
            
            // Prevent duplicates
            if existingIngredient == nil {
                ingredients.append([
                    "name": ingredientName,
                    "measurement": measurement
                ])
            }
        }
        
        return ingredients
    }
}
