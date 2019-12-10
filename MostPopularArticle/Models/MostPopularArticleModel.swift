//
//  Source.swift
//  TechnologyAssessment
//
//  Created by Anand Yadav on 06/12/19.
//  Copyright © 2019 Anand Yadav. All rights reserved.
//

import Foundation

class MostPopularArticleModel {
    
    var id :Int!
    var title :String!
    var abstract :String!
    var publishedDate :String!

    init?(dictionary :JSONDictionary) {
        
        guard let id = dictionary["id"] as? Int,
            let title = dictionary["title"] as? String,
            let publishedDate = dictionary["published_date"] as? String,
            let abstract = dictionary["abstract"] as? String else {
                return nil
        }
        
        self.id = id
        self.title = title
        self.abstract = abstract
        self.publishedDate = publishedDate

    }
}
