//
//  CharacterInfoCell.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/15/22.
//

import UIKit

class CharacterInfoCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier: String = "characterInfoCell"
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupHierarchy()
        setupLayout()
        self.isUserInteractionEnabled = false
    }
    
    // MARK: - UI Elements
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - Configuration
    
    private func setupHierarchy() {
        self.addSubview(infoLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            infoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with info: String) {
        self.infoLabel.text = info
    }
}
