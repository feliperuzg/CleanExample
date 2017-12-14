//
//  HomePresenterSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 13-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample

class HomeViewMock: NSObject, HomeViewProtocol {
    var displayUserInformationCalled = false
    func displayUserInformation(user: String) {
        displayUserInformationCalled = true
    }
}

class HomePresenterSpec: XCTestCase {
    var sut: HomePresenterProtocol!
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testExample() {
        sut = HomePresenter()
        let viewMock = HomeViewMock()
        sut.attachView(viewMock)

        sut.getUserInformation()

        XCTAssertTrue(viewMock.displayUserInformationCalled)
    }
}
