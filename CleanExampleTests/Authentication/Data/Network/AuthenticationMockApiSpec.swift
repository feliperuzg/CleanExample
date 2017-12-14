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
        sut = AuthenticationMockApi(networkConfiguration: NetworkConfiguration())
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testApiCanReturnEntity() {
        let exp = expectation(description: "testApiCanReturnEntity")
        let model = LoginEntity(userName: "user", password: "pass")
        sut.executeLogin(with: model) { (entity, error) in
            XCTAssertNotNil(entity)
            XCTAssertEqual(entity?.token, "3IHrSxMGdpom0wRd_vJW6YLXV3Ui_u16FhjtoQbnOPw")
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testApiCanHanldeError() {
        let exp = expectation(description: "testApiCanHanldeError")
        let model = LoginEntity(userName: "", password: "")
        sut.executeLogin(with: model) { (entity, error) in
            XCTAssertNotNil(error)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}
