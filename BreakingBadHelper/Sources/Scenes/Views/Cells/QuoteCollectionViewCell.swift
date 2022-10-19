//
//  QuoteCollectionViewCell.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/19/22.
//

import UIKit
import SDWebImage

class QuoteCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "quoteCell"
    
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
        setupView()
    }
    
    // MARK: - UI Elements
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        imageView.addOverlay()
        return imageView
    }()
    
    private lazy var authorName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private lazy var quoteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    // MARK: - Configuration
    
    private func setupHierarchy() {
        self.addSubview(characterImage)
        self.addSubview(stackView)
        stackView.addArrangedSubview(authorName)
        stackView.addArrangedSubview(quoteLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: self.topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            characterImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            characterImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
//            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    private func setupView() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.isUserInteractionEnabled = false
    }
    
    func configure(with model: QuoteViewModel) {
        self.characterImage.sd_setImage(with: URL(string: model.imageURLString ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png?20200912122019"))
        self.authorName.text = model.displayAuthor
        self.quoteLabel.text = model.displayQuote
    }
}
