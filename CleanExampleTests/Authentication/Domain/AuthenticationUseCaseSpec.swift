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
        sut.executeLogin(withCredentials: "Juan", password: "1234", onSuccess: { (user) in
            XCTAssertNotNil(user)
            exp.fulfill()
        }) { (error) in
            XCTFail(error.localizedDescription)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testLoginFailure() {
        let sut = locator.useCases
        let exp = expectation(description: "testLoginFailure")
        sut.executeLogin(withCredentials: "", password: "1234", onSuccess: { (user) in
            XCTFail("User \(user.firstName) should not be here")
            exp.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error.code, 400)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}
