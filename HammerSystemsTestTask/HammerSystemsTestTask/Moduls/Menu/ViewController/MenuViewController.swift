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
    
    lazy var headAd = MenuHeaderCollectionAdapter { [self] string in
        print(string)
        
        guard let firstCategoryItem = foodArray.firstIndex(where: { $0.category == string }) else { return }
        
        self.mainView.tableView.scrollToRow(at: IndexPath(row: firstCategoryItem, section: 1), at: .top, animated: true)
    }
    
    let network: INetworkService = NetworkService()
    
    private let group = DispatchGroup()
    
    let categoriesArray = ["burger",
        "texas",
         "belgian",
         "kosher",
         "pizza",
         "drinks"]
    
    private var foodArray: [FoodViewModel] = []
    
    let adapter = CollectionAdapter()
    
    private let leftBarButtonView = MenuBarButtonView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for category in categoriesArray {
            
            group.enter()
            network.loadFood(category: category) { result in
                switch result {
                    
                case .success(let arr):
                    guard let arr = arr.menuItems else { return }
                    
                    let res = arr.compactMap { FoodViewModel(model: $0, category: category) }
                    
                    
                    self.foodArray.append(contentsOf: res)
                    self.group.leave()
                case .failure(let err):
                    print("ERROR --> \(err)")
                }
                self.group.wait()
            }
            self.group.wait()
        }
        
        print(self.foodArray.count)
        
        mainView.reloadData()
        
        mainView.tableViewDelegate = self
        mainView.tableViewDataSource = self
        
        headerView.collectionViewDataSource = headAd
        headerView.collectionViewDelegate = headAd
        
        
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
        switch indexPath.section {
        case 0:
            return 112
        case 1:
            return 170
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return foodArray.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuAdTableCell.id,
                                                           for: indexPath) as? MenuAdTableCell
            else { return UITableViewCell() }
            
            cell.collectionViewDelegate = adapter
            cell.collectionViewDataSource = adapter
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.id,
                                                           for: indexPath) as? MenuTableCell
            else { return UITableViewCell() }
            
            cell.setData(foodArray[indexPath.row])
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView,
                       didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
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
