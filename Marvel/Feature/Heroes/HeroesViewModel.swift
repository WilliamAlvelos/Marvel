//
//  HerosViewModel.swift
//  Marvel
//
//  Created by William Alvelos on 28/04/18.
//  Copyright © 2018 WilliamAlvelos. All rights reserved.
//

import Foundation

final class HeroesViewModel: NSObject {

    private let service: CharactersService

    // MARK: - vars and lets

    var reloadTableViewClosure: (() -> Void)?
    var showErrorClosure: (() -> Void)?
    var updateLoadingStatus: (() -> Void)?

    private var cellViewModels: [Hero] = [Hero]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }

    var error: Error? {
        didSet {
            self.showErrorClosure?()
        }
    }
    
    var isLoading: Bool = false
    
    // MARK: Inits

    init(service: CharactersService) {
        self.service = service
    }

    // MARK: Methods
    
    func getHeroes() {
        
        service.get(completion: { (characters) in
            self.cellViewModels = characters
        }, onError: { (error) in
            self.error = error
        })
    }
    
    func paginate() {
        service.paginate(completion: { (characters) in
            self.cellViewModels += characters
        }, onError: { (error) in
            self.error = error
        })
    }

    func title() -> String { return "Heros" }

    // MARK: - TableView
    public func cellViewModelForRowAt(indexPath: IndexPath) -> HeroViewModel {
        return HeroViewModel(hero: cellViewModels[indexPath.row])
    }

    func numberOfItems() -> Int {
        return cellViewModels.count
    }

}
