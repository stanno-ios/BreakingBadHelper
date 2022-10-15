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
    }
}

// MARK: - CharactersListViewModel

extension CharactersListViewModel {
    enum Strings {
        static let title: String = "Characters"
        static let charactersUrlString: String = "https://www.breakingbadapi.com/api/characters"
    }
}
