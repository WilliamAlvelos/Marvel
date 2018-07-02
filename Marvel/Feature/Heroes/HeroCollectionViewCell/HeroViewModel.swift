//
//  HeroViewModel.swift
//  Marvel
//
//  Created by William Alvelos on 29/04/18.
//  Copyright © 2018 WilliamAlvelos. All rights reserved.
//

import Foundation
import UIKit

class HeroViewModel: NSObject {

    var hero: Hero
    var image: String
    var height: CGFloat?

    init(hero: Hero) {
        self.hero = hero
        image = (hero.thumbnail?.path ?? "") + "." + (hero.thumbnail?.extension ?? "")
    }

}
