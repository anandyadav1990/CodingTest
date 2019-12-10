//
//  Constants.swift
//  TechnologyAssessment
//
//  Created by Anand Yadav on 06/12/19.
//  Copyright © 2019 Anand Yadav. All rights reserved.
//

import Foundation
import UIKit

struct Maximum {
    static let allowedCharactersForDescription = 70
}

struct Cells {
    static let mostPopularArticlesCell = "MostPopularArticlesCell"
}

struct URLConstants {
    
    private struct Domains {
        static let Dev = ""
        static let UAT = ""
        static let Local = ""
        static let QA = ""
        static let Live = "https://api.nytimes.com/svc/"
    }
    
    private  struct Routes {
        static let Api = "mostpopular/v2/viewed/7.json"
    }
    
    
    private struct GetUrl {
        static let primaryGetKey = "?api-key=YDkXtKAhOHlHS9APFLtZGB6j7VwAWIsu"
    }
    
    private  static let Domain = Domains.Live
    private  static let Route = Routes.Api
    private  static let getUrl = GetUrl.primaryGetKey
    private  static let BaseURL = Domain + Route + getUrl
    
    static var mostPopularArticle: String {
           return BaseURL
       }
    
}





