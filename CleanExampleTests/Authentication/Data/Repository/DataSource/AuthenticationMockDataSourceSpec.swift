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

        sut.executeLogin(withCredentials: "Juan", password: "1234", onSuccess: { (entity, token) in
            XCTAssertNotNil(entity)
            XCTAssertNotNil(token)
            exp.fulfill()
        }) { (error) in
            XCTFail(error.localizedDescription)
            exp.fulfill()
        }

        waitForExpectations(timeout: 3, handler: nil)
    }

    func testAuthenticationDataSourceCanReturnError() {
        let sut = locator.dataSource
        let exp = expectation(description: "testLoginDataSourceCanReturnError")
        sut.executeLogin(withCredentials: "", password: "", onSuccess: { (entity, token) in
            XCTFail("Neither Token \(token) or UserEntity: \(entity.firstName) have use here")
            exp.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}
