//
//  LoginMockApiSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class LoginMockApiSpec: XCTestCase {
    var sut: LoginMockApi!

    override func setUp() {
        super.setUp()
        sut = LoginMockApi()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testApiCanReturnEntity() {
        let exp = expectation(description: "testApiCanReturnEntity")
        sut.loginUser(withCredentials: "user", password: "pass", onSuccess: { (entity) in
            XCTAssertNotNil(entity)
            XCTAssertEqual(entity.firstName, "Juan")
            exp.fulfill()
        }) { (error) in
            XCTFail(error.localizedDescription)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testApiCanHanldeError() {
        let exp = expectation(description: "testApiCanHanldeError")
        sut.loginUser(withCredentials: "", password: "pass", onSuccess: { (entity) in
            XCTFail()
            exp.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error.localizedDescription, "BAD REQUEST")
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}
