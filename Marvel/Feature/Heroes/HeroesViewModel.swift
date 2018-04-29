//
//  HerosViewModel.swift
//  Marvel
//
//  Created by William Alvelos on 28/04/18.
//  Copyright © 2018 WilliamAlvelos. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class HeroesViewModel: NSObject {
    
    private let service: CharactersService
    
    //MARK :- vars and lets
    var characters = Variable([Results]())
    
    //MARK :- RX
    var charactersObservable: Observable<[Results]> {
        return characters.asObservable()
    }
    
    
    init(service: CharactersService) {
        self.service = service

    }
    
    func getHeroes() {
        service.get(completion: { (characters) in
            self.characters.value = characters
        }) { (error) in
            //TODO: THERE IS A ERROR SO YOU SHOULD DO SOME ACTION
        }
    }
    
    func title() -> String { return "Heros" }
    
}
