//
//  AuthenticationRepositorySpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class AuthenticationRepositorySpec: XCTestCase {

    let locator = AuthenticationServiceLocator()
    func testAuthenticationRepositoryCanSuccsessfullyLoginUser() {
        let sut = locator.repository
        let exp = expectation(description: "testLoginRepositoryCanSuccsessfullyLoginUser")
        sut.executeLogin(withCredentials: "Juan", password: "1234", onSuccess: { (user, token) in
            XCTAssertNotNil(user)
            XCTAssertNotNil(token)
            exp.fulfill()
        }, onError: { (error) in
            XCTFail(error.localizedDescription)
            exp.fulfill()
        })
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testAuthenticationRepositoryCanShowFailureLoginUser() {
        let sut = locator.repository
        let exp = expectation(description: "testLoginRepositoryCanShowFailureLoginUser")
        sut.executeLogin(withCredentials: "", password: "1234", onSuccess: { (user, token) in
            XCTFail("Neither Token \(token) or User: \(user.firstName) have use here")
            exp.fulfill()
        }, onError: { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error.code, 400)
            exp.fulfill()
        })
        waitForExpectations(timeout: 3, handler: nil)
    }
}
