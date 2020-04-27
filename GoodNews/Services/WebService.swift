//
//  WebService.swift
//  GoodNews
//
//  Created by Tan Vinh Phan on 4/27/20.
//  Copyright © 2020 PTV. All rights reserved.
//

import Foundation

class WebService {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let err = error {
                print(err.localizedDescription)
                completion(nil)
            } else if let safeData = data {
                print(safeData)
                
                if let articles = try? JSONDecoder().decode(ArticleList.self, from: safeData).articles {
                    
                    completion(articles)
                }
            }
            
        }
        
        dataTask.resume()
        
    }
}

