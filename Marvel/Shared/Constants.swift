//
//  Constants.swift
//  Animations
//
//  Created by William Alvelos on 2/8/18.
//  Copyright © 2018 William Alvelos. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    struct NibName {
        static let HeroesViewController = "HeroesViewController"
        static let HeroTableViewCell = "HeroTableViewCell"
        static let LoadingTableViewCell = "LoadingTableViewCell"

        static let HeroCollectionViewCell = "HeroCollectionViewCell"

    }

    struct Nib {
        static let HeroCollectionViewCell = UINib(nibName: Constants.NibName.HeroCollectionViewCell,
                                                  bundle: nil)

    }

    struct ReuseId {
        static let LoadingTableViewCell = "LoadingTableViewCellIdentifier"
        static let MainTableViewCell = "MainTableViewCellIdentifier"

        static let HeroCollectionViewCell = "HeroCollectionViewCell"
    }
}

extension Constants {
    struct Radius {
        static let `default` = 8
    }
}
