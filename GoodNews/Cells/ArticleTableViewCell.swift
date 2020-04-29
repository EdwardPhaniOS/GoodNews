//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by Tan Vinh Phan on 4/27/20.
//  Copyright © 2020 PTV. All rights reserved.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func visualizeCell(articleViewModel: ArticleViewModel) {
        self.titleLabel.text = articleViewModel.title
        self.descriptionLabel.text = articleViewModel.description
    }
}

