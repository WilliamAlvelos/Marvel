//
//  BaseViewController.swift
//  Marvel
//
//  Created by William Alvelos on 28/04/18.
//  Copyright © 2018 WilliamAlvelos. All rights reserved.
//

import Foundation
import UIKit

@objc protocol BaseViewControllerDelegate {
    @objc optional func setupTableView()
}

class BaseViewController: UIViewController, BaseViewControllerDelegate {
    
    weak var baseViewControllerDelegate: BaseViewControllerDelegate?

    func viewDidLoad(with view: BaseViewControllerDelegate) {
        super.viewDidLoad()
        baseViewControllerDelegate = view
        
        baseViewControllerDelegate?.setupTableView?()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
