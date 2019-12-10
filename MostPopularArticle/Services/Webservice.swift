//
//  Webservice.swift
//  TechnologyAssessment
//
//  Created by Anand Yadav on 06/12/19.
//  Copyright © 2019 Anand Yadav. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:Any]

class Webservice {
    private let sourcesURL = URL(string: URLConstants.mostPopularArticle)!
    var session = URLSession.shared
    func loadMostPopularArticle(completion :@escaping ([MostPopularArticleModel]) -> ()) {
        print(sourcesURL)
        print(session)
        session.dataTask(with: sourcesURL) { data, _, _ in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                let sourceDictionary = json as! JSONDictionary
                let dictionaries = sourceDictionary["results"] as! [JSONDictionary]
                
                let sources = dictionaries.compactMap(MostPopularArticleModel.init)
                
                DispatchQueue.main.async {
                    completion(sources)
                }
            }
            
        }.resume()
        
    }
    
}
