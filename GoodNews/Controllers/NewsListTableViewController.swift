//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Tan Vinh Phan on 4/27/20.
//  Copyright © 2020 PTV. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
       
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        navigationBar.prefersLargeTitles = true
        
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=21f5e5cbb1584dc3a396943bc7e14e82") {
            WebService().getArticles(url: url) { (articles) in
                
                print(articles?.first?.title ?? "no data")
            }
        }
        
    }
    
}


