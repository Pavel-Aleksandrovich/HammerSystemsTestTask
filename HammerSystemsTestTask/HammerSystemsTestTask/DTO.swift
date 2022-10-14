//
//  DTO.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 14.10.2022.
//

import Foundation
//API Key: 5abbbc3716094d93b1ca6e7cbff63ea1

// burger
// "texas"
// "belgian"
// kosher
// pizza
// drinks

// ?apiKey=5abbbc3716094d93b1ca6e7cbff63ea1

// https://api.spoonacular.com/food/menuItems/2354


// MARK: - Food
struct Food: Codable {
    let type: String?
    let menuItems: [MenuItem]?
//    let offset, number, totalMenuItems, processingTimeMS: Int?
//    let expires: Int?
//    let isStale: Bool?

//    enum CodingKeys: String, CodingKey {
//        case type, menuItems, offset, number, totalMenuItems
//        case processingTimeMS = "processingTimeMs"
//        case expires, isStale
//    }
}

// MARK: - MenuItem
struct MenuItem: Codable {
    let id: Int?
    let title: String?
    let image: String?
//    let imageType: ImageType?
    let restaurantChain: String?
//    let servingSize, readableServingSize: String?
//    let servings: Servings?
}

//enum ImageType: String, Codable {
//    case jpg = "jpg"
//}

// MARK: - Servings
//struct Servings: Codable {
//    let number: Int?
//    let size: Int?
//    let unit: String?
//}

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
