//
//  Dictionary+Merge.swift
//  Marvel
//
//  Created by William Alvelos on 10/07/2018.
//  Copyright © 2018 WilliamAlvelos. All rights reserved.
//

import Foundation

extension Dictionary {
    func merge(with dictionary: Dictionary?) -> [String: Any] {
        return self.merging(dictionary ?? [:]) { (first, _) -> Value in first } as! [String: Any]
    }
}
