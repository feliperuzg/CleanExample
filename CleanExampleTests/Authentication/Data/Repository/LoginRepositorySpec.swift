//
//  LoginRepositorySpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class LoginRepositorySpec: XCTestCase {

    let locator = LoginServiceLocator()
    func testLoginRepositoryCanSuccsessfullyLoginUser() {
        let sut = locator.repository
        let exp = expectation(description: "testLoginRepositoryCanSuccsessfullyLoginUser")
        sut.loginUser(withCredentials: "Juan", password: "1234", onSuccess: { (user, token) in
            XCTAssertNotNil(user)
            exp.fulfill()
        }) { (error) in
            XCTFail(error.localizedDescription)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testLoginRepositoryCanShowFailureLoginUser() {
        let sut = locator.repository
        let exp = expectation(description: "testLoginRepositoryCanShowFailureLoginUser")
        sut.loginUser(withCredentials: "", password: "1234", onSuccess: { (user, token) in
            XCTFail()
            exp.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error.code, 400)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}
