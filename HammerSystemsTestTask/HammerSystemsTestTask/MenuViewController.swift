//
//  ViewController.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 13.10.2022.
//

import UIKit



final class MenuViewController: UIViewController {
    
    private let mainView = MenuMainView()
    let headerView = MenuHeaderCollectionView()
    
    private let leftBarButtonView = MenuBarButtonView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.tableViewDelegate = self
        mainView.tableViewDataSource = self
        
        headerView.collectionViewDataSource = self
        headerView.collectionViewDelegate = self
        
        
        let item = UIBarButtonItem(customView: leftBarButtonView)
        navigationItem.leftBarButtonItem = item
        
        navigationController?.navigationBar.tintColor = .black
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(),
                                                               for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.id, for: indexPath) as? MenuTableCell else { return UITableViewCell() }
        
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case 1:
            return 72
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView,
                   heightForFooterInSection section: Int) -> CGFloat {
        300
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return nil
        case 1:
            
            return headerView
        default:
            return nil
        }
        
    }
    
    
}

extension MenuViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let font = UIFont.systemFont(ofSize: 18)
        let attributes = [NSAttributedString.Key.font : font as Any]
        let width = Category.allCases[indexPath.item]
            .rawValue.size(withAttributes: attributes).width + 20
        
        return CGSize(width: width,
                      height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath,
                                    at: .centeredHorizontally,
                                    animated: true)
//        self.onCellTappedHandler?(Category.allCases[indexPath.item].rawValue)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        Category.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuHeaderCollectionCell.id,
            for: indexPath) as? MenuHeaderCollectionCell else { return UICollectionViewCell() }
        
        let category = Category.allCases[indexPath.item].rawValue
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
