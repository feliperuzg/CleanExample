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
        sut.loginUser(withCredentials: "user", password: "pass", onSuccess: { (entity) in
            XCTAssertNotNil(entity)
            XCTAssertEqual(entity.firstName, "Juan")
        }) { (error) in
            XCTFail(error.localizedDescription)
        }
    }

    func testApiCanHanldeError() {
        sut.loginUser(withCredentials: "", password: "pass", onSuccess: { (entity) in
            XCTFail()
        }) { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error.localizedDescription, "BAD REQUEST")
        }
    }
}
