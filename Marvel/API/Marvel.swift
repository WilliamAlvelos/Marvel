//
//  marvel.swift
//  Animations
//
//  Created by William Alvelos on 2/8/18.
//  Copyright © 2018 William Alvelos. All rights reserved.
//

import Foundation
import CryptoSwift

struct ParamKeys {
    static let apikey = "apikey"
    static let hash = "hash"
    static let timeStamp = "ts"
    static let limit = "limit"
    static let offset = "offset"
    static let searchName = "nameStartsWith"
}

struct Marvel {

    private enum Keys: String {
        case privatKey = "252003dafe243b67ac7b4d4f8f3fd16abc4b4214"
        case publicKey = "8a13919f4c92b10f75223805677c8d37"
    }

    static var defaultParams: [String: Any] {
        let timeStamp = Int(Date().timeIntervalSince1970)
        let hash = "\(timeStamp)\(Keys.privatKey.rawValue)\(Keys.publicKey.rawValue)"

        return [
            ParamKeys.apikey: Keys.publicKey.rawValue,
            ParamKeys.timeStamp: timeStamp,
            ParamKeys.hash: hash.md5()
        ]
    }
}
