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

    // MARK: IBOutlet
    @IBOutlet var collectionView: UICollectionView!

    // MARK: Properties
    var viewModel: HeroesViewModel!
    let disposeBag = DisposeBag()
    
    fileprivate let itemsPerRow: CGFloat = 3
    fileprivate let sectionInsets: UIEdgeInsets = UIEdgeInsets(top: 50,
                                                               left: 20,
                                                               bottom: 50,
                                                               right: 20)

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad(with: self)
        title = viewModel.title()
        navigationController?.navigationBar.prefersLargeTitles = true
        configSearch()
        
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getHeroes()
    }

    func setupUI() {
        collectionView.register(Constants.Nib.HeroCollectionViewCell,
                                forCellWithReuseIdentifier: Constants.ReuseId.HeroCollectionViewCell)

        // Constants.Identifier.LoadingTableViewCell)
    }
    func setupObservables() {
        viewModel.reloadTableViewClosure = { [weak self] () in
            self?.collectionView.reloadData()
        }
        viewModel.showErrorClosure = { [weak self] () in
            self?.errorView.showError(with: "Que merda ein")
        }
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

// TODO: improve this to be a clean architeture
extension HeroesViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.ReuseId.HeroCollectionViewCell,
                                                      for: indexPath) as! HeroCollectionViewCell

        cell.viewModel = viewModel.cellViewModelForRowAt(indexPath: indexPath)
        cell.setup {
            cell.activityIndicatorView.stopAnimating()
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension HeroesViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}


// TODO: Pagination

//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == viewModel.numberOfItems() - 1 {
//            let footerView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
//            footerView.startAnimating()
//            tableView.tableFooterView = footerView
////            viewModel.getHeroes()
//        }
//    }

extension HeroesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

    }
}
