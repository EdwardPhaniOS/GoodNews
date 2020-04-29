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
    
    private var articleListVM: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        tableView.dataSource = self
        tableView.delegate = self
       
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        navigationBar.prefersLargeTitles = true
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=21f5e5cbb1584dc3a396943bc7e14e82") {
            WebService().getArticles(url: url) { (articles) in
                
                if let articleList = articles {
                    
                    self.articleListVM = ArticleListViewModel(articles: articleList)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
}

//
//MARK: - NewsListTableViewControllerDataSource
//
extension NewsListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return articleListVM?.numberOfSection ?? 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListVM?.numberOfRowInSection(section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell
        
        guard let safeCell = cell,
                let articleVM = articleListVM?.articleAtIndex(indexPath.row)
            else {
                fatalError("cellForRowAtIndexPath error: ArticleTableViewCell not found") }
        
        cell?.visualizeCell(articleViewModel: articleVM)
        
        return safeCell
    }
    
}


