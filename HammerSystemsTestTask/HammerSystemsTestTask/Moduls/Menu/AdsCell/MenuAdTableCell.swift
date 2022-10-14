//
//  MenuAdTableCell.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 14.10.2022.
//

import UIKit

final class MenuAdTableCell: UITableViewCell {
    
    static let id = String(describing: MenuAdTableCell.self)
    
    private let layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: layout)
    
    var collectionViewDelegate: UICollectionViewDelegate? {
        get {
            nil
        }
        set {
            self.collectionView.delegate = newValue
        }
    }
    
    var collectionViewDataSource: UICollectionViewDataSource? {
        get {
            nil
        }
        set {
            self.collectionView.dataSource = newValue
        }
    }
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configAppearance()
        self.makeConstraints()
        
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuAdTableCell {
    
    func config(_ category: String) {
//        self.categoryLabel.text = category
    }
}

// MARK: - Config Appearance
private extension MenuAdTableCell {
    
    func configAppearance() {
        self.configView()
        self.configLayout()
        self.configCollectionView()
    }
    
    func configView() {
        self.backgroundColor = .white
        selectionStyle = .none
    }
    
    func configLayout() {
        self.layout.minimumInteritemSpacing = 16
        self.layout.scrollDirection = .horizontal
    }
    
    func configCollectionView() {
        self.collectionView.backgroundColor = .clear
        self.collectionView.register(MenuAdCollectionCell.self,
                                     forCellWithReuseIdentifier: MenuAdCollectionCell.id)
    }
}

// MARK: - Make Constraints
private extension MenuAdTableCell {
    
    func makeConstraints() {
        self.makeCollectionViewConstraints()
    }
    
    func makeCollectionViewConstraints() {
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
}
