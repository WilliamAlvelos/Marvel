//
//  ViewController.swift
//  Animations
//
//  Created by William Alvelos on 2/7/18.
//  Copyright © 2018 William Alvelos. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HeroesViewController: BaseViewController {
    
    var viewModel: HeroesViewModel!
    
    @IBOutlet weak var heroesTableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad(with: self)
        
        title = viewModel.title()
        
        viewModel.charactersObservable
            .subscribe(onNext: { [weak self] character in
                self?.heroesTableView.reloadData()
            }).disposed(by: disposeBag)
        
        configSearch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getHeroes()
    }
    
    func setupTableView() {
        heroesTableView.tableFooterView = UIView()
        heroesTableView.register(UINib(nibName: Constants.NibName.LoadingTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.identifier.LoadingTableViewCell)
        
        heroesTableView.register(UINib(nibName: Constants.NibName.HeroTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.identifier.MainTableViewCell)
    }
    
    
    func configSearch() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        
        if #available(iOS 11.0, *) {
            self.navigationItem.searchController = search
            self.navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    
}


//FIXME :- change this to be a clean architeture
extension HeroesViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = heroesTableView.dequeueReusableCell(withIdentifier: Constants.identifier.MainTableViewCell, for: indexPath) as? HeroTableViewCell else { return UITableViewCell() }
        
        let character = self.viewModel.characters.value[indexPath.row]
        
        cell.nameLabel.text = character.name
        cell.photoImage.downloadImage(fromStringURL: (character.thumbnail?.path ?? "") + "." + (character.thumbnail?.extension ?? ""))
        
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.value.count
    }
}


extension HeroesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
