//
//  ImageFamily.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 16.10.2022.
//

import UIKit

enum ImageFamily {
    case arrow
    case menu
    case contact
    case profile
    case cart
    case ads
    
    var name: UIImage? {
        switch self {
        case .arrow: return UIImage(named: "arrow")
        case .menu: return UIImage(named: "menu")
        case .contact: return UIImage(named: "contact")
        case .profile: return UIImage(named: "profile")
        case .cart: return UIImage(named: "cart")
        case .ads: return UIImage(named: "ads")
        }
    }
}
