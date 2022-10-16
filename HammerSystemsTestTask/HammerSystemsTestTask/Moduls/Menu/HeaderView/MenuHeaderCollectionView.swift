//
//  MenuHeaderView.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 14.10.2022.
//

import UIKit

final class MenuHeaderCollectionView: UIView {
    
    private let layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: layout)
    
    var delegate: UICollectionViewDelegate? {
        get {
            nil
        }
        set {
            collectionView.delegate = newValue
        }
    }
    
    var dataSource: UICollectionViewDataSource? {
        get {
            nil
        }
        set {
            collectionView.dataSource = newValue
        }
    }
    
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
private extension MenuHeaderCollectionView {
    
    func configAppearance() {
        backgroundColor = .white
        
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MenuHeaderCollectionCell.self,
                                forCellWithReuseIdentifier: MenuHeaderCollectionCell.id)
    }
}

// MARK: - Make Constraints
private extension MenuHeaderCollectionView {
    
    func makeConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
        ])
    }
}
