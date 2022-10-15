//
//  CharacterImageCell.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/15/22.
//

import UIKit

class CharacterImageCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier: String = "characterImageCell"
    
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
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    // MARK: - Configuration
    
    private func setupHierarchy() {
        self.addSubview(characterImageView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            characterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            characterImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            characterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with image: String) {
        self.characterImageView.sd_setImage(with: URL(string: image)!)
    }
}
