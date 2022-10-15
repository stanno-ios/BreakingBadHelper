//
//  CharactersListViewModel.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/15/22.
//

import Foundation
import RxSwift

class CharactersListViewModel {
    
    let title = Strings.title
    let resource = Resource<CharacterResponse>(url: URL(string: Strings.charactersUrlString)!)
    var items: Observable<[CharacterViewModel]>!
    private let bag = DisposeBag()
    private let service: NetworkService
    
    init(service: NetworkService = NetworkService()) {
        self.service = service
        self.fetchViewModels()
    }
    
    private func fetchViewModels() {
        items = Observable.just(service.fetch(from: resource))
            .flatMap({ response in
                response.map { characters in
                    characters.map { character in
                        return CharacterViewModel(character: character)
                    }
                }
            })
    }
    
    func filterModels(with models: [CharacterViewModel], query: String) -> [CharacterViewModel] {
        if query.isEmpty {
            return models
        } else {
            return models.filter({
                $0.displaySingleName.hasPrefix(query) || $0.displaySingleNickname.hasPrefix(query)
            })
        }
    }
}
