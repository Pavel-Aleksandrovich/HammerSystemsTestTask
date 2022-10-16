//
//  ViewController.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 13.10.2022.
//

import UIKit

protocol IMenuViewController: AnyObject {
    func reloadData()
    func scrollTo(row: Int, section: Int)
}

final class MenuViewController: UIViewController {
    
    private let mainView = MenuView()
    private let headerView = MenuHeaderCollectionView()
    private let adapter = CollectionAdapter()
    private let leftBarButtonView = MenuBarButtonView()
    
    private let presenter: IMenuPresenter
    
    private lazy var headerCollectionAdapter = MenuHeaderCollectionAdapter { [ weak self ] string in
        self?.presenter.didSelectCategory(string)
    }
    
    init(presenter: IMenuPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewAttached(controller: self)
        configAppearance()
    }
}

extension MenuViewController: IMenuViewController {
    
    func scrollTo(row: Int, section: Int) {
        mainView.scrollTo(row: row, section: section)
    }
    
    func reloadData() {
        mainView.reloadData()
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
            return presenter.numberOfRowsInSection
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuAdsTableCell.id,
                                                           for: indexPath) as? MenuAdsTableCell
            else { return UITableViewCell() }
            
            cell.delegate = adapter
            cell.dataSource = adapter
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.id,
                                                           for: indexPath) as? MenuTableCell
            else { return UITableViewCell() }
            
            let food = presenter.getFoodByIndex(indexPath.row)
            
            presenter.loadImageData(food.image) { data in
                cell.setImageData(data)
            }
            
            cell.setData(food)
            
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

// MARK: - Config Appearance
private extension MenuViewController {
    
    func configAppearance() {
        mainView.delegate = self
        mainView.dataSource = self
        
        headerView.dataSource = headerCollectionAdapter
        headerView.delegate = headerCollectionAdapter
        
        
        let item = UIBarButtonItem(customView: leftBarButtonView)
        navigationItem.leftBarButtonItem = item
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage(),
                                                               for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
