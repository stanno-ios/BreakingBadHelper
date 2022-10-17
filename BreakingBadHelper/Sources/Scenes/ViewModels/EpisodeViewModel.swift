//
//  EpisodeViewModel.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/17/22.
//

import Foundation

class EpisodeViewModel {
    let episode: Episode
    
    var displayTitle: String {
        return episode.title
    }
    
    var displayAirDate: String {
        return episode.airDate
    }
    
    var displaySeason: String {
        return episode.season
    }
    
    var displayCharacters: String {
        return episode.characters.joined(separator: ", ")
    }
    
    var displayEpisodeNumber: String {
        return episode.episodeNumber
    }
    
    init(episode: Episode) {
        self.episode = episode
    }
}
