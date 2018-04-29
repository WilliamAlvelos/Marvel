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
    
    private var herosViewController : HeroesViewController = {
        let herosViewController = HeroesViewController(nibName: Constants.NibName.HeroesViewController, bundle: Bundle.main)
        
        herosViewController.viewModel  = HeroesViewModel(service: CharactersService())
        
        return herosViewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainViewController = UINavigationController(rootViewController: herosViewController)
        
        mainViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        
        let tabBarList = [mainViewController]
        
        self.viewControllers = tabBarList
    }
    
}

extension MainTabBarController: UITabBarControllerDelegate { }
