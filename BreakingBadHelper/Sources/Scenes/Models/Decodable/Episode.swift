//
//  Episode.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/17/22.
//

import Foundation

struct Episode: Decodable {
    let episodeId: Int
    let title: String
    let season: String
    let airDate: String
    let characters: [String]
    let episodeNumber: String
    
    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case airDate = "air_date"
        case episodeNumber = "episode"
        case title, characters, season
    }
}

typealias EpisodesResponse = [Episode]
