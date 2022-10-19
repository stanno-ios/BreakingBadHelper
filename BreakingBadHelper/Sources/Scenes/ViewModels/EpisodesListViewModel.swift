//
//  EpisodesListViewModel.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/17/22.
//

import Foundation
import RxSwift

class EpisodesListViewModel {
    
    let resource = Resource<EpisodesResponse>(url: URL(string: Strings.resourceUrl)!)
    var items: Observable<[EpisodeViewModel]>!
    private let bag = DisposeBag()
    private let service: NetworkService
    
    init(service: NetworkService = NetworkService()) {
        self.service = service
        self.fetchViewModels()
    }
    
    private func fetchViewModels() {
        items = Observable.just(service.fetch(from: resource))
            .flatMap({ repsonse in
                repsonse.map { episodes in
                    episodes.map { episode in
                        return EpisodeViewModel(episode: episode)
                    }
                }
            })
    }
    
    func filterModels(with models: [EpisodeViewModel], query: String) -> [EpisodeViewModel] {
        if query.isEmpty {
            return models
        } else {
            return models.filter({
                $0.displayTitle.hasPrefix(query) ||
                $0.displayCharacters.hasPrefix(query) ||
                $0.displayAirDate.hasPrefix(query)
            })
        }
    }
}
