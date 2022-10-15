//
//  CharacterDetailsController.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/15/22.
//

import UIKit
import RxSwift
import RxCocoa

class CharacterDetailsController: UIViewController {
    
    private let bag = DisposeBag()
    
    // MARK: - ViewModel
    
    var viewModel: CharacterViewModel!
    
    // MARK: - CharacterDetailsView
    
    private var characterDetailsView: CharacterDetailsView? {
        guard isViewLoaded else { return nil }
        return view as? CharacterDetailsView
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = CharacterDetailsView()
        self.title = viewModel.displaySingleName
        self.characterDetailsView?.tableView.rx.setDelegate(self).disposed(by: bag)
        bindViewModel()
    }
    
    // MARK: - Rx bindings
    
    private func bindViewModel() {
        guard let characterDetailsView = characterDetailsView else { return }
        let properties = viewModel.getAllProperties()
        properties.asObservable()
            .observe(on: MainScheduler.instance)
            .bind(to: characterDetailsView.tableView.rx.items) { tv, row, item -> UITableViewCell in
                if row == 0 {
                    let cell = tv.dequeueReusableCell(withIdentifier: CharacterImageCell.identifier, for: IndexPath(row: row, section: 0)) as! CharacterImageCell
                    print(item)
                    cell.configure(with: item.1)
                    return cell
                } else {
                    let cell = tv.dequeueReusableCell(withIdentifier: CharacterInfoCell.identifier, for: IndexPath(row: row, section: 0)) as! CharacterInfoCell
                    cell.configure(with: item)
                    return cell
                }
            }.disposed(by: bag)
    }
}

// MARK: UITableViewDelegate

extension CharacterDetailsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.bounds.height * 0.6
        } else {
            return 55
        }
    }
}
