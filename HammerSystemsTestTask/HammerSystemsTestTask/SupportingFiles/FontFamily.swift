//
//  FontFamily.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 16.10.2022.
//

import UIKit

enum FontFamily {
    case display(size: CGFloat)
    
    var name: UIFont? {
        switch self {
        case .display(let size):
            return UIFont(name: "sfuidisplay-bold", size: size)
        }
    }
}
