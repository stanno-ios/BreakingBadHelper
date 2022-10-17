//
//  EpisodeCell.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/17/22.
//

import UIKit

class EpisodeCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "episodeCell"
    
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
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var episodeRowStack: UIStackView = createRowStackView()
    private lazy var episodeRowTitle: UILabel = createLabel(with: .systemFont(ofSize: 16, weight: .regular), textColor: .systemGray2)
    private lazy var episodeTitle: UILabel = createLabel(with: .systemFont(ofSize: 24, weight: .bold), textColor: .label)
    
    private lazy var seasonRowStack: UIStackView = createRowStackView()
    private lazy var seasonRowTitle: UILabel = createLabel(with: .systemFont(ofSize: 16, weight: .regular), textColor: .systemGray2)
    private lazy var seasonTitle: UILabel = createLabel(with: .systemFont(ofSize: 18, weight: .semibold), textColor: .label)
    
    private lazy var charactersRowStack: UIStackView = createRowStackView()
    private lazy var charactersRowTitle: UILabel = createLabel(with: .systemFont(ofSize: 16, weight: .regular), textColor: .systemGray2)
    private lazy var charactersLabel: UILabel = createLabel(with: .systemFont(ofSize: 18, weight: .regular), textColor: .label)
    
    private lazy var episodeNumberRowStack: UIStackView = createRowStackView()
    private lazy var episodeNumberRowTitle: UILabel = createLabel(with: .systemFont(ofSize: 16, weight: .regular), textColor: .systemGray2)
    private lazy var episodeNumber: UILabel = createLabel(with: .systemFont(ofSize: 18, weight: .regular), textColor: .label)
    
    private lazy var airedRowStack: UIStackView = createRowStackView()
    private lazy var airedRowTitle: UILabel = createLabel(with: .systemFont(ofSize: 16, weight: .regular), textColor: .systemGray2)
    private lazy var airedTitle: UILabel = createLabel(with: .systemFont(ofSize: 18, weight: .regular), textColor: .label)
    
    private func createLabel(with font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = textColor
        return label
    }
    
    private func createRowStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }
    
    // MARK: - Configuration
    
    private func setupHierarchy() {
        self.addSubview(contentStackView)
        contentStackView.addArrangedSubview(episodeRowStack)
        contentStackView.addArrangedSubview(seasonRowStack)
        contentStackView.addArrangedSubview(charactersRowStack)
        contentStackView.addArrangedSubview(episodeNumberRowStack)
        contentStackView.addArrangedSubview(airedRowStack)
        episodeRowStack.addArrangedSubview(episodeRowTitle)
        episodeRowStack.addArrangedSubview(episodeTitle)
        seasonRowStack.addArrangedSubview(seasonRowTitle)
        seasonRowStack.addArrangedSubview(seasonTitle)
        charactersRowStack.addArrangedSubview(charactersRowTitle)
        charactersRowStack.addArrangedSubview(charactersLabel)
        episodeNumberRowStack.addArrangedSubview(episodeNumberRowTitle)
        episodeNumberRowStack.addArrangedSubview(episodeNumber)
        airedRowStack.addArrangedSubview(airedRowTitle)
        airedRowStack.addArrangedSubview(airedTitle)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with model: EpisodeViewModel) {
        self.episodeRowTitle.text = "Title"
        self.episodeTitle.text = model.displayTitle
        self.seasonRowTitle.text = "Season"
        self.seasonTitle.text = model.displaySeason
        self.charactersRowTitle.text = "Characters"
        self.charactersLabel.text = model.displayCharacters
        self.episodeNumberRowTitle.text = "Episode"
        self.episodeNumber.text = model.displayEpisodeNumber
        self.airedRowTitle.text = "Aired on"
        self.airedTitle.text = model.displayAirDate
    }
}
