//
//  QuotesController.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/18/22.
//

import UIKit
import RxSwift
import RxCocoa

class QuotesController: UIViewController {
    
    // MARK: - DisposeBag
    
    private let bag = DisposeBag()
    
    // MARK: - ViewModel
    
    private var viewModel: QuotesListViewModel!
    
    // MARK: - QuotesView
    
    private var quotesView: QuotesView? {
        guard isViewLoaded else { return nil }
        return view as? QuotesView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = QuotesView()
        self.viewModel = QuotesListViewModel()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.bindViewModel()
    }
    
    // MARK: - Rx bindings
    
    private func bindViewModel() {
        guard let quotesView = quotesView else { return }
        self.viewModel.items
            .observe(on: MainScheduler.instance)
            .bind(to: quotesView.collectionView.rx.items(cellIdentifier: QuoteCollectionViewCell.identifier, cellType: QuoteCollectionViewCell.self)) { _, model, cell in
                cell.configure(with: model)
            }.disposed(by: bag)
    }
}
