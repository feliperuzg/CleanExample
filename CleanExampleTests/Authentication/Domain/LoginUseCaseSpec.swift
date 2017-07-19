//
//  LoginUseCaseSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class LoginUseCaseSpec: XCTestCase {
    let locator = LoginServiceLocator()
    func testLoginSuccessful() {
        let sut = locator.useCases
        sut.loginUser(withCredentials: "Juan", password: "1234", onSuccess: { (user) in
            XCTAssertNotNil(user)
        }) { (error) in
            XCTFail(error.localizedDescription)
        }
    }

    func testLoginFailure() {
        let sut = locator.useCases
        sut.loginUser(withCredentials: "", password: "1234", onSuccess: { (user) in
            XCTFail()
        }) { (error) in
            XCTAssertNotNil(error)
            XCTAssertEqual(error.code, 400)
        }
    }
}
