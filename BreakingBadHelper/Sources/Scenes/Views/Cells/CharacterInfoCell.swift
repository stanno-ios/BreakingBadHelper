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
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Metric.titleFontSize, weight: .regular)
        label.textColor = .systemGray3
        label.textAlignment = .left
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Metric.infoLabelFontSize, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - Configuration
    
    private func setupHierarchy() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(infoLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metric.cellPadding / 2),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.cellPadding),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metric.cellPadding),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metric.cellPadding / 2)
        ])
    }
    
    func configure(with info: (String, String)) {
        self.titleLabel.text = info.0.capitalized
        self.infoLabel.text = info.1
    }
}
