//
//  MainTabBarController.swift
//  Marvel
//
//  Created by William Alvelos on 16/04/18.
//  Copyright © 2018 WilliamAlvelos. All rights reserved.
//

import UIKit
import Foundation

class MainTabBarController: UITabBarController {

    private var herosViewController: HeroesViewController = {
        let herosViewController = HeroesViewController(nibName: Constants.NibName.HeroesViewController, bundle: Bundle.main)

        herosViewController.viewModel = HeroesViewModel(service: CharactersService())

        return herosViewController
    }()
    
    private var whoAmIViewController: WhoAmIViewController = {
        let whoAmIViewController = WhoAmIViewController(nibName: Constants.NibName.WhoAmIViewController, bundle: Bundle.main)

        whoAmIViewController.viewModel = WhoAmIViewModel(service: CharactersService())
        
        return whoAmIViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let herosViewController = UINavigationController(rootViewController: self.herosViewController)
        
        let whoAmIViewController = UINavigationController(rootViewController: self.whoAmIViewController)

        herosViewController.tabBarItem = UITabBarItem(title: "Heros",
                                                     image: UIImage(named: "superhero"),
                                                     tag: 0)
        
        whoAmIViewController.tabBarItem = UITabBarItem(title: "Who am I?",
                                                     image: UIImage(named: "superhero"),
                                                     tag: 1)
        
        self.viewControllers = [herosViewController, whoAmIViewController]
    }

}

extension MainTabBarController: UITabBarControllerDelegate { }
