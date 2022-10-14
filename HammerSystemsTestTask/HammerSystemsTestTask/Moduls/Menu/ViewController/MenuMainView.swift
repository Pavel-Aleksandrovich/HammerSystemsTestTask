//
//  MenuView.swift
//  HammerSystemsTestTask
//
//  Created by pavel mishanin on 13.10.2022.
//

import UIKit

final class MenuMainView: UIView {
    
    let tableView = UITableView()
    
    var tableViewDelegate: UITableViewDelegate? {
        get {
            nil
        }
        set {
            self.tableView.delegate = newValue
        }
    }
    
    var tableViewDataSource: UITableViewDataSource? {
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

extension MenuMainView {
    
    func reloadData() {
        self.tableView.reloadData()
    }
}

// MARK: - Config Appearance
private extension MenuMainView {
    
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
        tableView.register(MenuAdTableCell.self,
                                forCellReuseIdentifier: MenuAdTableCell.id)
    }
}

// MARK: - Make Constraints
private extension MenuMainView {
    
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
