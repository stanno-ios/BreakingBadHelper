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
        stackView.spacing = Metric.stackSpacing
        return stackView
    }()
    
    private lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Metric.cellCornerRadius
        imageView.contentMode = .scaleAspectFill
        imageView.addOverlay()
        return imageView
    }()
    
    private lazy var authorName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Metric.authorLabelFontSize, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private lazy var quoteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = Metric.quoteLabelNumberOfLines
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: Metric.quoteLabelFontSize, weight: .regular)
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
            
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.cellPadding),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metric.cellPadding),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metric.cellPadding)
        ])
    }
    
    private func setupView() {
        self.clipsToBounds = true
        self.layer.cornerRadius = Metric.cellCornerRadius
        self.isUserInteractionEnabled = false
    }
    
    func configure(with model: QuoteViewModel) {
        self.characterImage.sd_setImage(with: URL(string: model.imageURLString ?? Strings.defaultImageUrlString))
        self.authorName.text = model.displayAuthor
        self.quoteLabel.text = model.displayQuote
    }
}
