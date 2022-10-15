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
}
