//
//  MainTableViewCell.swift
//  Animations
//
//  Created by William Alvelos on 2/8/18.
//  Copyright © 2018 William Alvelos. All rights reserved.
//

import UIKit
import AlamofireImage

class HeroTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet var viewHeightConstraint: NSLayoutConstraint!
    
    var viewModel: HeroViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(completion: @escaping() -> Void) {
        nameLabel.text = viewModel.hero.name
        photoImage.downloadImage(fromStringURL: viewModel.image) {
            if self.viewHeightConstraint.constant != (self.photoImage.image?.height(forWidth: self.frame.width))! {
                
                self.viewHeightConstraint.constant = (self.photoImage.image?.height(forWidth: self.frame.width))!
                completion()
            }
        }
    }

}
