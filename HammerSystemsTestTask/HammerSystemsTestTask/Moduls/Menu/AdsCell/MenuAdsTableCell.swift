//
//  MenuAdTableCell.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 14.10.2022.
//

import UIKit

final class MenuAdsTableCell: UITableViewCell {
    
    static let id = String(describing: MenuAdsTableCell.self)
    
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
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configAppearance()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Config Appearance
private extension MenuAdsTableCell {
    
    func configAppearance() {
        configView()
        configLayout()
        configCollectionView()
    }
    
    func configView() {
        backgroundColor = .white
        selectionStyle = .none
    }
    
    func configLayout() {
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
    }
    
    func configCollectionView() {
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(MenuAdsCollectionCell.self,
                                forCellWithReuseIdentifier: MenuAdsCollectionCell.id)
    }
}

// MARK: - Make Constraints
private extension MenuAdsTableCell {
    
    func makeConstraints() {
        makeCollectionViewConstraints()
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
