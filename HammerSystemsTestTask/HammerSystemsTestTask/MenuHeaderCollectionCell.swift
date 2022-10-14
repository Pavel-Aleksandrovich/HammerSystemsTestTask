//
//  MenuHeaderCollectionCell.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 14.10.2022.
//

import UIKit

final class MenuHeaderCollectionCell: UICollectionViewCell {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 5
    }
    
    static let id = String(describing: MenuHeaderCollectionCell.self)
    
    private let categoryLabel = UILabel()
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = self.isSelected ? .lightGray : .systemGray4
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configAppearance()
        self.makeConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(frame.height)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuHeaderCollectionCell {
    
    func config(_ category: String) {
        self.categoryLabel.text = category
    }
}

private extension MenuHeaderCollectionCell {
    
    func configAppearance() {
        self.configImageNameLabel()
        self.configView()
    }
    
    func configView() {
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
    }
    
    func configImageNameLabel() {
        self.categoryLabel.textAlignment = .center
    }
    
    func makeConstraints() {
        self.makeImageNameLabelConstraints()
    }
    
    func makeImageNameLabelConstraints() {
        addSubview(categoryLabel)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
