//
//  AuthenticationMockApiSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class AuthenticationMockApiSpec: XCTestCase {
    var sut: AuthenticationMockApi!

    override func setUp() {
        super.setUp()
        sut = AuthenticationMockApi()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testApiCanReturnEntity() {
        let exp = expectation(description: "testApiCanReturnEntity")
        sut.executeLogin(withCredentials: "user", password: "pass", onSuccess: { (entity, token) in
            XCTAssertNotNil(entity)
            XCTAssertEqual(entity.firstName, "Juan")
            XCTAssertEqual(token, "asdfghjkl1234567890")
            exp.fulfill()
        }, onError: { (error) in
            XCTFail(error.localizedDescription)
            exp.fulfill()
        })
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testApiCanHanldeError() {
        let exp = expectation(description: "testApiCanHanldeError")
        sut.executeLogin(withCredentials: "", password: "pass", onSuccess: { (entity, token) in
            XCTFail("Neither Token \(token) or UserEntity: \(entity.firstName) have use here")
            exp.fulfill()
        }, onError: { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error.localizedDescription, "BAD REQUEST")
            exp.fulfill()
        })
        waitForExpectations(timeout: 3, handler: nil)
    }
}
