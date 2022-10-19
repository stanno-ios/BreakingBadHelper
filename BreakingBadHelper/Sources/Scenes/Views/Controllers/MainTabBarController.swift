//
//  MainTabBarController.swift
//  BreakingBadHelper
//
//  Created by Stanislav Rassolenko on 10/15/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewControllers()
        self.tabBar.tintColor = .label
    }
    
    fileprivate func createNavigationController(for rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        rootViewController.title = title
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.tabBarItem.image = image
        return controller
    }
    
    private func setupViewControllers() {
        viewControllers = [
            createNavigationController(for: CharactersController(), image: UIImage(systemName: Strings.charactersTabImageName)!, title: "Characters"),
            createNavigationController(for: EpisodesController(), image: UIImage(systemName: "play.laptopcomputer")!, title: "Episodes"),
            createNavigationController(for: QuotesController(), image: UIImage(systemName: "newspaper")!, title: "Quotes")
        ]
    }
}
