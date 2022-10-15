//
//  CharacterTableViewCell.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/15/22.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier: String = "characterCell"
    
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
    }
    
    // MARK: - UI Elements
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Metric.characterImageCornerRadius
        return imageView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var characterName = createLabel(with: .systemFont(ofSize: Metric.characterNameFontSize, weight: .bold))
    private lazy var nicknameLabel = createLabel(with: .systemFont(ofSize: Metric.characterNicknameFontSize, weight: .semibold))
    private lazy var statusLabel = createLabel(with: .systemFont(ofSize: Metric.characterStatusFontSize, weight: .regular))
    
    private func createLabel(with font: UIFont) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = font
        return label
    }
    
    // MARK: - Configuration
    
    private func setupHierarchy() {
        self.addSubview(characterImageView)
        self.addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(characterName)
        labelsStackView.addArrangedSubview(nicknameLabel)
        labelsStackView.addArrangedSubview(statusLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metric.cellPadding),
            characterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.cellPadding),
            characterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metric.cellPadding),
            characterImageView.widthAnchor.constraint(equalTo: self.heightAnchor, constant: -Metric.cellPadding * 2),
            
            labelsStackView.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: Metric.cellPadding),
            labelsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metric.cellPadding),
            labelsStackView.bottomAnchor.constraint(equalTo: characterImageView.bottomAnchor)
        ])
    }
    
    func configure(with model: CharacterViewModel) {
        self.characterImageView.sd_setImage(with: URL(string: model.displayImage)!)
        self.characterName.text = model.displayName
        self.nicknameLabel.text = model.displayNickname
        self.statusLabel.text = model.displayStatus
    }
}
