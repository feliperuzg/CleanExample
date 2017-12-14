//
//  HomeViewControllerSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 13-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample

class HomeViewControllerSpec: XCTestCase {
    var sut: HomeViewController!
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testViewCanInitialize() {
        sut = HomeViewController(HomePresenter())

        XCTAssertNotNil(sut)
    }
}
