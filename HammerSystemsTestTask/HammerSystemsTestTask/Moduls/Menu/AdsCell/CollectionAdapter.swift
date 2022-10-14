//
//  CollectionAdapter.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 14.10.2022.
//

import UIKit

final class CollectionAdapter: NSObject {
    
    override init() {
    }
}

extension CollectionAdapter:   UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width/5,
                      height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        20
    }
     
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuAdCollectionCell.id,
            for: indexPath) as? MenuAdCollectionCell else { return UICollectionViewCell() }
        
        return cell
    }
}

