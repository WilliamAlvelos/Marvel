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
        
        heroesTableView.estimatedRowHeight = 500
        heroesTableView.rowHeight = UITableViewAutomaticDimension
        
        title = viewModel.title()
        
        viewModel.charactersObservable.subscribe(onNext: { [weak self] character in
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let heroViewModel = self.viewModel.cellViewModelForRowAt(indexPath: indexPath)
        
        guard let cell = heroesTableView.dequeueReusableCell(withIdentifier: Constants.identifier.MainTableViewCell, for: indexPath) as? HeroTableViewCell else { return UITableViewCell() }
        
        cell.viewModel = heroViewModel
        
        cell.setup {
            self.heroesTableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.value.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.numberOfItems() - 1 {
            let footerView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            footerView.startAnimating()
            tableView.tableFooterView = footerView
//            viewModel.getHeroes()
        }
    }
}


extension HeroesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
