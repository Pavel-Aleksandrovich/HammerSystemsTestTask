//
//  FoodViewModel.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 16.10.2022.
//

import Foundation

struct FoodViewModel {
    let id: Int
    let title: String
    let image: String
    let restaurantChain: String
    var category: String
    
    init?(model: MenuItem, category: String) {
        guard let id = model.id,
              let title = model.title,
              let image = model.image,
              let restaurantChain = model.restaurantChain else { return nil }
        
        self.id = id
        self.title = title
        self.image = image
        self.restaurantChain = restaurantChain
        self.category = category
    }
}
