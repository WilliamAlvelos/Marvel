//
//  WhoAmIViewController.swift
//  Marvel
//
//  Created by William Alvelos on 03/07/2018.
//  Copyright © 2018 WilliamAlvelos. All rights reserved.
//

import UIKit
import Darwin

class WhoAmIViewController: BaseViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var heroImageView: UIImageView!
    @IBOutlet private weak var nextHeroButton: UIButton!
    @IBOutlet private weak var guessHeroTextField: UITextField!
    
    var viewModel: WhoAmIViewModel!
    private var currentHero: Hero?
    
    
    override func viewDidLoad() {
        super.viewDidLoad(with: self)
        title = viewModel.title()
        navigationController?.navigationBar.prefersLargeTitles = true
        setupObservables()
        viewModel.getHeroes()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupObservables() {
        viewModel.updateButtonState = { [weak self] (isEnabled) in
            self?.nextHeroButton.isEnabled = isEnabled
        }
    }
    
    // MARK: Actions
    @IBAction func nextHeroTap(_ sender: UIButton) {
        self.currentHero = viewModel.heros[Int(arc4random_uniform(UInt32(viewModel.heros.count)))]
        let urlString = (self.currentHero?.thumbnail?.path ?? "") + "." + (self.currentHero?.thumbnail?.extension ?? "")
        
        self.heroImageView.downloadImage(fromStringURL: urlString) {
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
