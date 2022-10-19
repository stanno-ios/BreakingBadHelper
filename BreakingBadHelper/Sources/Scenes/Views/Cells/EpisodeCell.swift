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
        stackView.spacing = Metric.contentSpacing
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var episodeRowStack: UIStackView = createRowStackView()
    private lazy var episodeRowTitle: UILabel = createLabel(with: .systemFont(ofSize: Metric.rowTitleFontSize, weight: .regular), textColor: .systemGray2)
    private lazy var episodeTitle: UILabel = createLabel(with: .systemFont(ofSize: Metric.episodeTitleFontSize, weight: .bold), textColor: .label)
    
    private lazy var seasonRowStack: UIStackView = createRowStackView()
    private lazy var seasonRowTitle: UILabel = createLabel(with: .systemFont(ofSize: Metric.rowTitleFontSize, weight: .regular), textColor: .systemGray2)
    private lazy var seasonTitle: UILabel = createLabel(with: .systemFont(ofSize: Metric.titleFontSize, weight: .semibold), textColor: .label)
    
    private lazy var charactersRowStack: UIStackView = createRowStackView()
    private lazy var charactersRowTitle: UILabel = createLabel(with: .systemFont(ofSize: Metric.rowTitleFontSize, weight: .regular), textColor: .systemGray2)
    private lazy var charactersLabel: UILabel = createLabel(with: .systemFont(ofSize: Metric.titleFontSize, weight: .regular), textColor: .label)
    
    private lazy var episodeNumberRowStack: UIStackView = createRowStackView()
    private lazy var episodeNumberRowTitle: UILabel = createLabel(with: .systemFont(ofSize: Metric.rowTitleFontSize, weight: .regular), textColor: .systemGray2)
    private lazy var episodeNumber: UILabel = createLabel(with: .systemFont(ofSize: Metric.titleFontSize, weight: .regular), textColor: .label)
    
    private lazy var airedRowStack: UIStackView = createRowStackView()
    private lazy var airedRowTitle: UILabel = createLabel(with: .systemFont(ofSize: Metric.rowTitleFontSize, weight: .regular), textColor: .systemGray2)
    private lazy var airedTitle: UILabel = createLabel(with: .systemFont(ofSize: Metric.titleFontSize, weight: .regular), textColor: .label)
    
    private func createLabel(with font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.numberOfLines = Metric.labelNumberOfLines
        label.textAlignment = .left
        label.textColor = textColor
        return label
    }
    
    private func createRowStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = Metric.rowSpacing
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
            contentStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metric.cellPadding),
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.cellPadding),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metric.cellPadding),
            contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metric.cellPadding)
        ])
    }
    
    func configure(with model: EpisodeViewModel) {
        self.episodeRowTitle.text = Strings.title
        self.episodeTitle.text = model.displayTitle
        self.seasonRowTitle.text = Strings.season
        self.seasonTitle.text = model.displaySeason
        self.charactersRowTitle.text = Strings.characters
        self.charactersLabel.text = model.displayCharacters
        self.episodeNumberRowTitle.text = Strings.episode
        self.episodeNumber.text = model.displayEpisodeNumber
        self.airedRowTitle.text = Strings.airedOn
        self.airedTitle.text = model.displayAirDate
    }
}
