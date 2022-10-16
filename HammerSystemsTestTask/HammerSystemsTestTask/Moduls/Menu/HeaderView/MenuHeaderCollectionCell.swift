//
//  MenuHeaderCollectionCell.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 14.10.2022.
//

import UIKit

final class MenuHeaderCollectionCell: UICollectionViewCell {
    
    static let id = String(describing: MenuHeaderCollectionCell.self)
    
    private let titleLabel = UILabel()
    
    override var isSelected: Bool {
        didSet {
            isSelected(bool: oldValue)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellDidNotSelect()
        configAppearance()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuHeaderCollectionCell {
    
    func config(_ category: String) {
        self.titleLabel.text = category
    }
}

// MARK: - Logic
private extension MenuHeaderCollectionCell {
    
    func isSelected(bool: Bool) {
        switch isSelected {
        case true:
            cellDidSelect()
        case false:
            cellDidNotSelect()
        }
    }
    
    func cellDidSelect() {
        titleLabel.textColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 1)
        titleLabel.font = UIFont.systemFont(ofSize: 13,
                                            weight: UIFont.Weight(700))
        
        backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 1).withAlphaComponent(0.2)
        
        layer.borderWidth = 0
    }
    
    func cellDidNotSelect() {
        backgroundColor = .white
        
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 1).withAlphaComponent(0.4).cgColor
        
        titleLabel.font = FontFamily.display(size: 13).name
        titleLabel.textColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 1).withAlphaComponent(0.4)
    }
}

// MARK: - Config Appearance
private extension MenuHeaderCollectionCell {
    
    func configAppearance() {
        layer.cornerRadius = 16
        
        titleLabel.textAlignment = .center
    }
}

// MARK: - Make Constraints
private extension MenuHeaderCollectionCell {
    
    func makeConstraints() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
