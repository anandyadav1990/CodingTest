//
//  MostPopularArticleTests.swift
//  MostPopularArticleTests
//
//  Created by Anand Yadav on 08/12/19.
//  Copyright © 2019 Anand Yadav. All rights reserved.
//

import XCTest
@testable import MostPopularArticle

class MostPopularArticleTests: XCTestCase {
    
    var httpClient: HttpClient!
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        httpClient = HttpClient(session: session)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetRequestWithURL() {

        guard let url = URL(string: URLConstants.mostPopularArticle) else {
            fatalError("URL should not be empty")
        }
        
        httpClient.get(url: url) { (success, response) in
            // Return data
        }
        print(session.lastURL)
        XCTAssert(session.lastURL == url)
        
    }
    
    func testGetRequestResumeCalled() {
        
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        
        guard let url = URL(string: URLConstants.mostPopularArticle) else {
            fatalError("URL should not be empty")
        }
        
        httpClient.get(url: url) { (success, response) in
            // Return data
        }
        
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func testGetRequestShouldReturnData() {
        let expectedData = "{}".data(using: .utf8)
        
        session.nextData = expectedData
        
        var actualData: Data?
        httpClient.get(url: URL(string: URLConstants.mostPopularArticle)!) { (data, error) in
            actualData = data
        }
        XCTAssertNotNil(actualData)
    }
}
