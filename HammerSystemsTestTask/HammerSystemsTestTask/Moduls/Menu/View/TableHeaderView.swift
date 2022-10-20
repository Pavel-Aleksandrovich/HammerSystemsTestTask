//
//  TableHeaderView.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 20.10.2022.
//

import UIKit

final class TableHeaderView: UIView {
    
    init() {
        super.init(frame: .zero)
        
        clipsToBounds = true
        layer.cornerRadius = 25
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
