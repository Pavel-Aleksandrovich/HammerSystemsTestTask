//
//  FoodDTO.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 14.10.2022.
//

import Foundation

struct FoodDTO: Codable {
    let type: String?
    let menuItems: [MenuItem]?
}

struct MenuItem: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let restaurantChain: String?
}
