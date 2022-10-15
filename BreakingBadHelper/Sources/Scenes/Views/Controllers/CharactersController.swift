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
    
    private var viewModel: CharactersListViewModel!
    let bag = DisposeBag()
    
    private var charactersView: CharactersView? {
        guard isViewLoaded else { return nil }
        return view as? CharactersView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupController()
    }
    
    private func setupController() {
        view = CharactersView()
        self.viewModel = CharactersListViewModel()
        self.title = self.viewModel.title
        self.navigationController?.navigationBar.prefersLargeTitles = true
        charactersView?.tableView.rx.setDelegate(self).disposed(by: bag)
        self.bindViewModel()
    }
    
    private func bindViewModel() {
        guard let charactersView = charactersView else { return }
        self.viewModel.items
            .asObservable()
            .observe(on: MainScheduler.instance)
            .bind(to: charactersView.tableView.rx.items(cellIdentifier: CharacterTableViewCell.identifier, cellType: CharacterTableViewCell.self)) { _, model, cell in
                cell.configure(with: model)
                cell.accessoryType = .disclosureIndicator
            }.disposed(by: bag)
    }
}

extension CharactersController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height / 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

