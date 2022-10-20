//
//  MenuBarButtonView.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 14.10.2022.
//

import UIKit

final class MenuBarButtonView: UIView {
    
    private let title = UILabel()
    private let imageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
        configAppearance()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Config Appearance
private extension MenuBarButtonView {
    
    func configAppearance() {
        imageView.image = ImageFamily.arrow.name
        imageView.contentMode = .scaleAspectFill
        
        title.text = "Moscow"
        title.textColor = #colorLiteral(red: 0.1333333333, green: 0.1568627451, blue: 0.1921568627, alpha: 1)
        title.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    }
}

// MARK: - Make Constraints
private extension MenuBarButtonView {
    
    func makeConstraints() {
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.topAnchor.constraint(equalTo: topAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 8),
            imageView.widthAnchor.constraint(equalToConstant: 14),
        ])
    }
}
