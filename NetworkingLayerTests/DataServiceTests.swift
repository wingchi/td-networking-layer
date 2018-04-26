//
//  DataServiceTests.swift
//  NetworkingLayerTests
//
//  Created by wingchi on 4/26/18.
//  Copyright © 2018 The Test and the Driven. All rights reserved.
//

import XCTest
@testable import NetworkingLayer

class DataServiceTests: XCTestCase {
    
    func testGetArticle() {
        let articleFetchExpectation = expectation(description: "Data Service should fetch and decode article")
        let dataService = DataService(useLocalData: true)
        dataService.getArticle { article in
            XCTAssertEqual(article.title, "This One Has An Image")
            XCTAssertNotNil(article.image)
            articleFetchExpectation.fulfill()
        }
        wait(for: [articleFetchExpectation], timeout: 2.0)
    }
}
