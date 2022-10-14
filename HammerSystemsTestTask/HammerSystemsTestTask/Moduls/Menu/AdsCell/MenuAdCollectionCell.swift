//
//  MenuAdCollectionCell.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 14.10.2022.
//

import UIKit

final class MenuAdCollectionCell: UICollectionViewCell {
    
    static let id = String(describing: MenuAdCollectionCell.self)
    
    private let adImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.configAppearance()
//        self.makeConstraints()
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuAdCollectionCell {
    
    func config(_ category: String) {
//        self.categoryLabel.text = category
    }
}

private extension MenuAdCollectionCell {
    
    func configAppearance() {
        self.configView()
    }
    
    func configView() {
        adImageView.backgroundColor = .gray
        adImageView.layer.cornerRadius = 20
        adImageView.isUserInteractionEnabled = true
        
        adImageView.resignFirstResponder()
    }
    
    func makeConstraints() {
        self.makeImageNameLabelConstraints()
    }
    
    func makeImageNameLabelConstraints() {
        addSubview(adImageView)
        adImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            adImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            adImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            adImageView.topAnchor.constraint(equalTo: topAnchor),
            adImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
