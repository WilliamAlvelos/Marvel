//
//  WhoAmIViewModel.swift
//  Marvel
//
//  Created by William Alvelos on 03/07/2018.
//  Copyright © 2018 WilliamAlvelos. All rights reserved.
//

import Foundation

class WhoAmIViewModel {
    
    private let service: CharactersService
    private(set) var heros: [Hero] = []
    
    var updateButtonState: ((_ isEnabled: Bool) -> Void)?
    
    init(service: CharactersService) {
        self.service = service
        self.updateButtonState?(false)
    }
    
    func title() -> String { return "Who am I? Try to guess" }
    
    // MARK: Methods
    func getHeroes() {
        service.get(completion: { (heros) in
            self.heros = heros
            self.updateButtonState?(true)
        }, onError: { (error) in
        })
    }
    
    func paginate() {
        service.paginate(completion: { (heros) in
            self.heros += heros
        }, onError: { (error) in
        })
    }
}
