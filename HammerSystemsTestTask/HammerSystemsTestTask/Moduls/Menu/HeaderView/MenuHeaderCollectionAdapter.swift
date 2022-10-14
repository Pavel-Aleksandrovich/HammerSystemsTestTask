//
//  MenuHeaderCollectionAdapter.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 14.10.2022.
//

import UIKit

final class MenuHeaderCollectionAdapter: NSObject {
    
    let onCellTappedHandler: (String) -> ()
    
    let categoriesArray = ["burger",
        "texas",
         "belgian",
         "kosher",
         "pizza",
         "drinks"]
    
    init(completion: @escaping(String) -> ()) {
        self.onCellTappedHandler = completion
    }
}

extension MenuHeaderCollectionAdapter: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let font = UIFont.systemFont(ofSize: 18)
        let attributes = [NSAttributedString.Key.font : font as Any]
        let width = categoriesArray[indexPath.item]
            .size(withAttributes: attributes).width + 20
        
        return CGSize(width: width,
                      height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath,
                                    at: .centeredHorizontally,
                                    animated: true)
        onCellTappedHandler(categoriesArray[indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        categoriesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuHeaderCollectionCell.id,
            for: indexPath) as? MenuHeaderCollectionCell else { return UICollectionViewCell() }
        
        let category = categoriesArray[indexPath.item]
        cell.config(category)
        
        return cell
    }
}

enum Category: String, CaseIterable {
    case general
    case business
    case entertainment
    case health
    case science
    case sports
    case technology
}
