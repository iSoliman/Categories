//
//  CategoriesTests.swift
//  CategoriesTests
//
//  Created by Islam Soliman on 11/25/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import XCTest
@testable import Categories



class NetworkMockUP: NetworkManager {
    
    override func getList(success: ([String]) -> Void, failure: (String) -> Void) {
        
        let categories = ["Animals", "Anime", "Anti-Malware", "Art & Design", "Books"]
        success(categories)
    }
}

class CategorySceneMockup: CategoryViewProtocol {
    
    func categoriesDidLoadSuccessfully(_ categories: [String]) {
        
        XCTAssert(categories.count == 5)
    }
    
    func errorCallingAPI(errorMsg: String) {
        
        
    }
    
    
    
}

class CategoriesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        let mockup = NetworkMockUP()
        let sceneMockUP = CategorySceneMockup()
        let categoriesPresenter = CategoryPresenter(scene: sceneMockUP, service: mockup)
        
        categoriesPresenter.loadCategories()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
