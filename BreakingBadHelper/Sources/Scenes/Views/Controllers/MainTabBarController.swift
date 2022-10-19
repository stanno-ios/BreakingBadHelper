//
//  MainTabBarController.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/15/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewControllers()
        self.tabBar.tintColor = .label
    }
    
    // MARK: - Create controllers
    
    fileprivate func createNavigationController(for rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        rootViewController.title = title
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.tabBarItem.image = image
        return controller
    }
    
    private func setupViewControllers() {
        viewControllers = [
            createNavigationController(for: CharactersController(), image: UIImage(systemName: Strings.charactersTabImageName)!, title: Strings.charactersTabTitle),
            createNavigationController(for: EpisodesController(), image: UIImage(systemName: Strings.episodesTabImageName)!, title: Strings.episodesTabTitle),
            createNavigationController(for: QuotesController(), image: UIImage(systemName: Strings.quotesTabImageName)!, title: Strings.quotesTabTitle)
        ]
    }
}
