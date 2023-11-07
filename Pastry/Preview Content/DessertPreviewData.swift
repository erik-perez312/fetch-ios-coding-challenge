//
//  DessertPreviewData.swift
//  Pastry
//
//  Created by Erik Perez on 11/6/23.
//

import Foundation

enum DessertPreviewData {
    static var desserts: [Dessert] {
        guard let pieURL = Bundle.main.url(forResource: "pie", withExtension: "jpg"),
              let browniesURL = Bundle.main.url(forResource: "brownies", withExtension: "jpg"),
              let cremeBruleeURL = Bundle.main.url(forResource: "creme-brulee", withExtension: "jpg"),
              let cakeURL = Bundle.main.url(forResource: "cake", withExtension: "jpg") else {
            return []
        }
        
        return [
            .init(id: "52893",
                  name: "Apple & Blackberry Crumble",
                  thumbnail: pieURL.absoluteString),
            .init(id: "52860",
                  name: "Chocolate Raspberry Brownies",
                  thumbnail: browniesURL.absoluteString),
            .init(id: "52990",
                  name: "Christmas cake",
                  thumbnail: cakeURL.absoluteString),
            .init(id: "52917",
                  name: "White chocolate creme brulee",
                  thumbnail: cremeBruleeURL.absoluteString)
        ]
    }
    
    static let appleCrumbleDetails = DessertDetails(
        id: "52893",
        instructions: "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.",
        ingredients: [
            .init(name: "Plain Flour", measurement: "120g"),
            .init(name: "Caster Sugar", measurement: "60g"),
            .init(name: "Butter", measurement: "60g"),
            .init(name: "Braeburn Apples", measurement: "300g"),
            .init(name: "Butter", measurement: "30g"),
            .init(name: "Demerara Sugar", measurement: "30g"),
            .init(name: "Blackberrys", measurement: "120g"),
            .init(name: "Cinnamon", measurement: "¼ teaspoon"),
            .init(name: "Ice Cream", measurement: "to serve")
        ],
        imageURL: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
        name: "Apple & Blackberry Crumble")
}
