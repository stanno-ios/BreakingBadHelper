//
//  Quote.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/19/22.
//

import Foundation

struct Quote: Decodable {
    let quote: String
    let author: String
}

typealias QuotesResponse = [Quote]
