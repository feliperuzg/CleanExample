//
//  AuthenticationUseCaseSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class AuthenticationUseCaseSpec: XCTestCase {
    let locator = AuthenticationServiceLocator()
    func testLoginSuccessful() {
        let sut = locator.useCases
        let exp = expectation(description: "testLoginSuccessful")
        let model = LoginModel(userName: "Juan", password: "1234")
        sut.executeLogin(with: model) { (error) in
            XCTAssertNil(error)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testLoginFailure() {
        let sut = locator.useCases
        let exp = expectation(description: "testLoginFailure")
        let model = LoginModel(userName: "", password: "")
        sut.executeLogin(with: model) { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.code, 400)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}
