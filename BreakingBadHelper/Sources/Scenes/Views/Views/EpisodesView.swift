//
//  EpisodesView.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/17/22.
//

import UIKit

class EpisodesView: UIView {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - UI Elements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: EpisodeCell.identifier)
        return tableView
    }()
    
    lazy var searchController: UISearchController = {
        let controller = UISearchController()
        return controller
    }()
    
    // MARK: - Configuration
    
    private func setupHierarchy() {
        self.addSubview(tableView)
        tableView.tableHeaderView = searchController.searchBar
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
