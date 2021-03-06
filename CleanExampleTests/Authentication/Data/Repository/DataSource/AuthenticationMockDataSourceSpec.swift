//
//  AuthenticationMockDataSourceSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class AuthenticationMockDataSourceSpec: XCTestCase {
    let locator = AuthenticationServiceLocator()

    func testAuthenticationDataSourceCanReturnEntity() {
        let sut = locator.dataSource
        let exp = expectation(description: "testLoginDataSourceCanReturnEntity")
        let entity = LoginEntity(userName: "Juan", password: "1234")
        sut.executeLogin(with: entity) { (token, error) in
            XCTAssertNotNil(token)
            XCTAssertNil(error)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testAuthenticationDataSourceCanReturnError() {
        let sut = locator.dataSource
        let exp = expectation(description: "testLoginDataSourceCanReturnError")
        let entity = LoginEntity(userName: "", password: "")
        sut.executeLogin(with: entity) { (token, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(token)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}
