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
        self.configView()
        self.configLayout()
        self.configCollectionView()
    }
    
    func configView() {
        self.backgroundColor = .white
    }
    
    func configLayout() {
        self.layout.minimumInteritemSpacing = 8
        self.layout.scrollDirection = .horizontal
    }
    
    func configCollectionView() {
        self.collectionView.backgroundColor = .clear
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.register(MenuHeaderCollectionCell.self,
                                     forCellWithReuseIdentifier: MenuHeaderCollectionCell.id)
    }
}

// MARK: - Make Constraints
private extension MenuHeaderCollectionView {
    
    func makeConstraints() {
        self.makeCollectionViewConstraints()
    }
    
    func makeCollectionViewConstraints() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
        ])
        
    }
}
