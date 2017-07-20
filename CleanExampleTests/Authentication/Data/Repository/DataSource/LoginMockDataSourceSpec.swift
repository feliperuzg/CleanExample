//
//  LoginMockDataSourceSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class LoginMockDataSourceSpec: XCTestCase {
    let locator = LoginServiceLocator()
    
    func testLoginDataSourceCanReturnEntity() {
        let sut = locator.dataSource
        let exp = expectation(description: "testLoginDataSourceCanReturnEntity")

        sut.loginUser(withCredentials: "Juan", password: "1234", onSuccess: { (entity, token) in
            XCTAssertNotNil(entity)
            exp.fulfill()
        }) { (error) in
            XCTFail(error.localizedDescription)
            exp.fulfill()
        }

        waitForExpectations(timeout: 3, handler: nil)
    }

    func testLoginDataSourceCanReturnError() {
        let sut = locator.dataSource
        let exp = expectation(description: "testLoginDataSourceCanReturnError")
        sut.loginUser(withCredentials: "", password: "", onSuccess: { (entity, token) in
            XCTFail()
            exp.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}
