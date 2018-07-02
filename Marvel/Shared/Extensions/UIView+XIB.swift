//
//  UIView+XIB.swift
//  Marvel
//
//  Created by William Alvelos on 27/06/2018.
//  Copyright © 2018 WilliamAlvelos. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    static func loadFromXib<T>(withOwner: Any? = nil, options: [AnyHashable: Any]? = nil) -> T where T: UIView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "\(self)", bundle: bundle)

        guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? T else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
}
