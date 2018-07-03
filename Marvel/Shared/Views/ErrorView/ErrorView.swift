//
//  ErrorView.swift
//  Marvel
//
//  Created by William Alvelos on 24/06/2018.
//  Copyright © 2018 WilliamAlvelos. All rights reserved.
//

import UIKit

class ErrorView: UIView {
    private static let className = "ErrorView"

    // MARK: IBOutlet
    @IBOutlet var messageErrorLabel: UILabel!

    func showError(with message: String) {
        self.isHidden = false
        self.messageErrorLabel.text = message
    }

    func dismiss() {
        UIView.animate(withDuration: 0.5) {
            self.isHidden = true
        }
    }

    class func instanceFromNib() -> ErrorView {
        return UINib(nibName: className, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ErrorView
    }
}
