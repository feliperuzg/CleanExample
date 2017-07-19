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
        sut.loginUser(withCredentials: "Juan", password: "1234", onSuccess: { (user) in
            XCTAssertNotNil(user)
        }) { (error) in
            XCTFail(error.localizedDescription)
        }
    }

    func testLoginRepositoryCanShowFailureLoginUser() {
        let sut = locator.repository
        sut.loginUser(withCredentials: "", password: "1234", onSuccess: { (user) in
            XCTFail()
        }) { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error.code, 400)
        }
    }
}
