//
//  LoadingTableViewCell.swift
//  Animations
//
//  Created by William Alvelos on 12/02/18.
//  Copyright © 2018 William Alvelos. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    @IBOutlet weak var paginationActivityIndicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        paginationActivityIndicatorView.startAnimating()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
