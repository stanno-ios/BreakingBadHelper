//
//  QuotesListViewModel.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/19/22.
//

import Foundation
import RxSwift

class QuotesListViewModel {
    let quotesResource = Resource<QuotesResponse>(url: URL(string: "https://www.breakingbadapi.com/api/quotes")!)
    let charactersResource = Resource<CharacterResponse>(url: URL(string: "https://www.breakingbadapi.com/api/characters")!)
    var items: Observable<[QuoteViewModel]>!
    private let service: NetworkService
    
    init(service: NetworkService = NetworkService()) {
        self.service = service
        self.fetchViewModels()
    }
    
    private func fetchViewModels() {
        items = Observable.zip(service.fetch(from: quotesResource), service.fetch(from: charactersResource))
            .map({ (quotesResponse, charactersResponse) in
                quotesResponse.map({ (quote) in
                    let char = charactersResponse.first { character in
                        character.name.hasPrefix(quote.author) || character.nickname.hasPrefix(quote.author.split(separator: " ").first!)
                    }
                    return QuoteViewModel(imageURLString: char?.img, quote: quote)
                })
            })
    }
}
