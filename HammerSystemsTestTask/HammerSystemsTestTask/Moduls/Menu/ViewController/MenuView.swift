//
//  MenuView.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 13.10.2022.
//

import UIKit

final class MenuView: UIView {
    
    private let tableView = UITableView()
    
    var delegate: UITableViewDelegate? {
        get {
            nil
        }
        set {
            self.tableView.delegate = newValue
        }
    }
    
    var dataSource: UITableViewDataSource? {
        get {
            nil
        }
        set {
            self.tableView.dataSource = newValue
        }
    }
    
    init() {
        super.init(frame: .zero)
        self.configAppearance()
        self.makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuView {
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func scrollTo(row: Int, section: Int) {
        tableView.scrollToRow(at: IndexPath(row: row, section: section),
                              at: .top,
                              animated: true)
    }
}

// MARK: - Config Appearance
private extension MenuView {
    
    func configAppearance() {
        configView()
        configTableView()
    }
    
    func configView() {
        backgroundColor = .white
    }
    
    func configTableView() {
        tableView.backgroundColor = .clear
        tableView.register(MenuTableCell.self,
                           forCellReuseIdentifier: MenuTableCell.id)
        tableView.register(MenuAdsTableCell.self,
                           forCellReuseIdentifier: MenuAdsTableCell.id)
    }
}

// MARK: - Make Constraints
private extension MenuView {
    
    func makeConstraints() {
        makeTableViewConstraints()
    }
    
    func makeTableViewConstraints() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
