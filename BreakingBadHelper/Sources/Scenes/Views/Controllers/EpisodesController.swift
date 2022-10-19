//
//  EpisodesController.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/17/22.
//

import UIKit
import RxSwift
import RxCocoa

class EpisodesController: UIViewController {
    
    // MARK: - DiposeBag
    
    private let bag = DisposeBag()
    
    // MARK: - ViewModel
    
    private var viewModel: EpisodesListViewModel!
    
    // MARK: - EpisodesView
    
    private var episodesView: EpisodesView? {
        guard isViewLoaded else { return nil }
        return view as? EpisodesView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = EpisodesView()
        self.viewModel = EpisodesListViewModel()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.episodesView?.tableView.rx.setDelegate(self).disposed(by: bag)
        self.bindViewModel()
        self.bindCellSelection()
    }
    
    // MARK: - Rx bindings
    
    private func bindViewModel() {
        guard let episodesView = episodesView else { return }
        
        let input = episodesView.searchController.searchBar
            .rx
            .text
            .orEmpty
            .observe(on: MainScheduler.asyncInstance)
            .distinctUntilChanged()
        
        Observable.combineLatest(self.viewModel.items, input) { [unowned self] (allEpisodes, query) -> [EpisodeViewModel] in
            return self.viewModel.filterModels(with: allEpisodes, query: query)
        }
        .bind(to: episodesView.tableView.rx.items(cellIdentifier: EpisodeCell.identifier, cellType: EpisodeCell.self)) { _, model, cell in
            cell.configure(with: model)
        }
        .disposed(by: bag)
    }
    
    private func bindCellSelection() {
        guard let episodesView = episodesView else { return }
        episodesView.tableView.rx
            .modelSelected(EpisodeViewModel.self)
            .subscribe(onNext: { _ in
                if let selectedRow = episodesView.tableView.indexPathForSelectedRow {
                    episodesView.tableView.deselectRow(at: selectedRow, animated: true)
                }
            }).disposed(by: bag)
    }
}

// MARK: - UITableViewDelegate

extension EpisodesController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
