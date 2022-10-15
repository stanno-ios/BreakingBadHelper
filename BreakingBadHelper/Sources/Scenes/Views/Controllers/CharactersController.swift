//
//  ViewController.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/15/22.
//

import UIKit
import RxSwift
import RxCocoa

class CharactersController: UIViewController {
    
    // MARK: - ViewModel
    
    private var viewModel: CharactersListViewModel!
    
    // MARK: - DisposeBag
    
    let bag = DisposeBag()
    
    // MARK: - CharactersView
    
    private var charactersView: CharactersView? {
        guard isViewLoaded else { return nil }
        return view as? CharactersView
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupController()
    }
    
    // MARK: - Configuration
    
    private func setupController() {
        view = CharactersView()
        self.viewModel = CharactersListViewModel()
        self.title = self.viewModel.title
        self.navigationController?.navigationBar.prefersLargeTitles = true
        charactersView?.tableView.rx.setDelegate(self).disposed(by: bag)
        self.bindViewModel()
        self.bindCellSelection()
    }
    
    // MARK: - Bindings
    
    private func bindViewModel() {
        guard let charactersView = charactersView else { return }
        
        let input = charactersView.searchController.searchBar
            .rx
            .text
            .orEmpty
            .observe(on: MainScheduler.asyncInstance)
            .distinctUntilChanged()
        
        Observable.combineLatest(self.viewModel.items, input) { [unowned self] (allChars, query) -> [CharacterViewModel] in
            return self.viewModel.filterModels(with: allChars, query: query)
        }
        .bind(to: charactersView.tableView.rx.items(cellIdentifier: CharacterTableViewCell.identifier, cellType: CharacterTableViewCell.self)) { _, model, cell in
            cell.configure(with: model)
            cell.accessoryType = .disclosureIndicator
        }
        .disposed(by: bag)
    }
    
    private func bindCellSelection() {
        guard let charactersView = charactersView else { return }
        charactersView.tableView.rx
            .modelSelected(CharacterViewModel.self)
            .bind { [unowned self] character in
                if let selectedRow = charactersView.tableView.indexPathForSelectedRow {
                    charactersView.tableView.deselectRow(at: selectedRow, animated: true)
                }
                let detailsController = CharacterDetailsController()
                detailsController.viewModel = character
                self.navigationController?.pushViewController(detailsController, animated: true)
            }.disposed(by: bag)
    }
}

// MARK: - UITableViewDelegate

extension CharactersController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height / 5
    }
}

