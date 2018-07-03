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
    
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate let sectionInsets: UIEdgeInsets = UIEdgeInsets(top: 20, left: 10,
                                                               bottom: 20, right: 10)

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad(with: self)
        title = viewModel.title()
        navigationController?.navigationBar.prefersLargeTitles = true
        configSearch()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getHeroes()
    }

    func setupUI() {
        collectionView.register(Constants.Nib.HeroCollectionViewCell,
                                forCellWithReuseIdentifier: Constants.ReuseId.HeroCollectionViewCell)
        
        collectionView.register(Constants.Nib.LoadingCollectionViewCell,
                                forSupplementaryViewOfKind: UICollectionElementKindSectionFooter,
                                withReuseIdentifier: Constants.ReuseId.LoadingCollectionViewCell)
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
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension HeroesViewController: UICollectionViewDelegateFlowLayout {
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
    
    // MARK: Pagination
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionFooter {
            viewModel.getHeroes(isPagination: true)

            return collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: Constants.ReuseId.LoadingCollectionViewCell,
                                                                   for: indexPath)
        }
        
        return UICollectionReusableView(frame: CGRect.zero)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if viewModel.isLoading {
            return CGSize.zero
        }
        return CGSize(width: collectionView.bounds.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        if elementKind == UICollectionElementKindSectionFooter {
            viewModel.isLoading = false
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.row == viewModel.numberOfItems() - 1 {
//            let footerView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
//            footerView.startAnimating()
//            collectionView.section  = footerView
//            viewModel.getHeroes()
//        }
//    }
}

extension HeroesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

    }
}
