//
//  Constants.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/15/22.
//

import Foundation

// MARK: - CharacterTableViewCell

extension CharacterTableViewCell {
    enum Metric {
        static let characterImageCornerRadius: CGFloat = 15
        static let characterNameFontSize: CGFloat = 24
        static let characterNicknameFontSize: CGFloat = 20
        static let characterStatusFontSize: CGFloat = 20
        static let cellPadding: CGFloat = 16
    }
}

// MARK: - MainTabBarController

extension MainTabBarController {
    enum Strings {
        static let charactersTabImageName: String = "person"
        static let charactersTabTitle: String = "Characters"
        static let episodesTabImageName: String = "play.laptopcomputer"
        static let episodesTabTitle: String = "Episodes"
        static let quotesTabImageName: String = "newspaper"
        static let quotesTabTitle: String = "Quotes"
    }
}

// MARK: - CharactersListViewModel

extension CharactersListViewModel {
    enum Strings {
        static let charactersUrlString: String = "https://www.breakingbadapi.com/api/characters"
    }
}

// MARK: - CharacterImageCell

extension CharacterImageCell {
    enum Metric {
        static let imageViewCornerRadius: CGFloat = 15
        static let imageViewPadding: CGFloat = 16
    }
}

// MARK: - CharacterInfoCell

extension CharacterInfoCell {
    enum Metric {
        static let titleFontSize: CGFloat = 16
        static let infoLabelFontSize: CGFloat = 18
        static let cellPadding: CGFloat = 16
    }
}

// MARK: - EpisodeCell

extension EpisodeCell {
    enum Metric {
        static let contentSpacing: CGFloat = 10
        static let rowTitleFontSize: CGFloat = 16
        static let episodeTitleFontSize: CGFloat = 24
        static let titleFontSize: CGFloat = 18
        static let labelNumberOfLines: Int = 0
        static let rowSpacing: CGFloat = 5
        static let cellPadding: CGFloat = 16
    }
    
    enum Strings {
        static let title: String = "Title"
        static let season: String = "Season"
        static let characters: String = "Characters"
        static let episode: String = "Episode"
        static let airedOn: String = "Aired on"
    }
}

// MARK: - QuoteCell

extension QuoteCollectionViewCell {
    enum Metric {
        static let stackSpacing: CGFloat = 5
        static let cellCornerRadius: CGFloat = 15
        static let authorLabelFontSize: CGFloat = 16
        static let quoteLabelNumberOfLines: Int = 0
        static let quoteLabelFontSize: CGFloat = 14
        static let cellPadding: CGFloat = 10
    }
    
    enum Strings {
        static let defaultImageUrlString: String = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png?20200912122019"
    }
}

// MARK: - CharacterDetailsController

extension CharacterDetailsController {
    enum Metric {
        static let rowHeightMultiplier: CGFloat = 0.6
        static let defaultRowHeight: CGFloat = 55
    }
}

// MARK: - EpisodesListViewModel

extension EpisodesListViewModel {
    enum Strings {
        static let resourceUrl: String = "https://www.breakingbadapi.com/api/episodes"
    }
}

// MARK: - QuotesListviewModel

extension QuotesListViewModel {
    enum Strings {
        static let quotesUrl: String = "https://www.breakingbadapi.com/api/quotes"
        static let charactersUrl: String = "https://www.breakingbadapi.com/api/characters"
    }
}
