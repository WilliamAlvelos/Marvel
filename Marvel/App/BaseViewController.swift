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
    @objc optional func setupUI()
    @objc optional func setupObservables()
}

class BaseViewController: UIViewController, BaseViewControllerDelegate {
    weak var baseViewControllerDelegate: BaseViewControllerDelegate?
    var errorView: ErrorView = ErrorView.loadFromXib()
    func viewDidLoad(with view: BaseViewControllerDelegate) {
        super.viewDidLoad()
        baseViewControllerDelegate = view
        baseViewControllerDelegate?.setupUI?()
        baseViewControllerDelegate?.setupObservables?()
        self.view.addSubview(errorView)
    }
}
