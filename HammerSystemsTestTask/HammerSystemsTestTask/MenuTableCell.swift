//
//  MenuTableCell.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 13.10.2022.
//

import UIKit

final class MenuTableCell: UITableViewCell {
    
    static let id = String(describing: MenuTableCell.self)
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceView = UIView()
    private let menuImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configAppearance()
        self.makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuTableCell {
    
    func setData(_ model: String) {
    }
}

// MARK: - Config Appearance
private extension MenuTableCell {
    
    func configAppearance() {
        configView()
        
        menuImageView.backgroundColor = .darkGray
        
        priceView.backgroundColor = .red
        
        titleLabel.text = "Баварские сосиски"
        titleLabel.numberOfLines = 0
        
        descriptionLabel.text = "Соси ски sad Соси ски das Соси ски dsa Соси ски Сос иски asd Соси ски dsa Сос иски ada с иски asd Соси ски dsa Сос иски ada"
        descriptionLabel.numberOfLines = 0
    }
    
    func configView() {
        selectionStyle = .none
    }
}

// MARK: - Make Constraints
private extension MenuTableCell {
    
    func makeConstraints() {
        menuImageViewConstraints()
        titleLabelConstraints()
        priceViewConstraints()
        descriptionLabelConstraints()
    }
    
    func menuImageViewConstraints() {
        addSubview(menuImageView)
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menuImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            menuImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            menuImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            menuImageView.widthAnchor.constraint(equalToConstant: 140),
        ])
    }
    
    func titleLabelConstraints() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: menuImageView.trailingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    func priceViewConstraints() {
        addSubview(priceView)
        priceView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            priceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            priceView.heightAnchor.constraint(equalToConstant: 32),
            priceView.widthAnchor.constraint(equalToConstant: 87)
        ])
    }
    
    func descriptionLabelConstraints() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.bottomAnchor.constraint(equalTo: priceView.topAnchor, constant: -16),
            descriptionLabel.leadingAnchor.constraint(equalTo: menuImageView.trailingAnchor, constant: 32),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }
}
