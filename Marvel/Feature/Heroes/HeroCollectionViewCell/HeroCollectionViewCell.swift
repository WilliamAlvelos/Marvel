//
//  MainTableViewCell.swift
//  Animations
//
//  Created by William Alvelos on 2/8/18.
//  Copyright © 2018 William Alvelos. All rights reserved.
//

import UIKit
import AlamofireImage

class HeroCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    var viewModel: HeroViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func setup(completion: @escaping() -> Void) {
        nameLabel.text = viewModel.hero.name
        activityIndicatorView.startAnimating()
        photoImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        photoImage.downloadImage(fromStringURL: viewModel.image) {
            completion()
        }
    }
    override func prepareForReuse() {
        photoImage.af_cancelImageRequest()
    }
}
