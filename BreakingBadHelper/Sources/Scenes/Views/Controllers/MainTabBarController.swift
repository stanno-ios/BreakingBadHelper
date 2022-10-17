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
    
    fileprivate func createNavigationController(for rootViewController: UIViewController, image: UIImage) -> UIViewController {
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.tabBarItem.image = image
        return controller
    }
    
    private func setupViewControllers() {
        let charactersController = CharactersController()
        charactersController.title = "Characters"
        let episodesController = EpisodesController()
        episodesController.title = "Episodes"
        
        viewControllers = [
            createNavigationController(for: charactersController, image: UIImage(systemName: Strings.charactersTabImageName)!),
            createNavigationController(for: episodesController, image: UIImage(systemName: "play.laptopcomputer")!)
        ]
    }
}
