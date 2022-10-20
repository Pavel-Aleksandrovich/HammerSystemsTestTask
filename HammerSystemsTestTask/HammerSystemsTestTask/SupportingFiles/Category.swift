//
//  Category.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 16.10.2022.
//

import Foundation

enum Category: String, CaseIterable {
    case burger = "burger"
    case texas = "texas"
    case belgian = "belgian"
    case kosher = "kosher"
    case pizza = "pizza"
    case drinks = "drinks"
}

enum ListSections {
    case ads
    case category([Category])
    
    var count: Int {
        switch self {
        case .ads:
            return 10
        case .category(let array):
            return array.count
        }
    }
}
