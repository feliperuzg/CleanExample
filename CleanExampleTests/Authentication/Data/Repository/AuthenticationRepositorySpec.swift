//
//  AuthenticationRepositorySpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample

class CodableMock: CodableHelper {
    override func decodeNetworkObject<D>(object: Data) -> D? where D : Decodable {
        return nil
    }
}

class AuthenticationRepositorySpec: XCTestCase {

    let locator = AuthenticationServiceLocator()
    func testAuthenticationRepositoryCanSuccsessfullyLoginUser() {
        let sut = locator.repository
        let exp = expectation(description: "testLoginRepositoryCanSuccsessfullyLoginUser")
        let model = LoginModel(userName: "Juan", password: "1234")
        sut.executeLogin(with: model) { (token, error) in
            XCTAssertNotNil(token)
            XCTAssertNil(error)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testAuthenticationRepositoryCanShowFailureLoginUser() {
        let sut = locator.repository
        let exp = expectation(description: "testLoginRepositoryCanShowFailureLoginUser")
        let model = LoginModel(userName: "", password: "")
        sut.executeLogin(with: model) { (token, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(token)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testCanHandlerCorruptedModel() {
        var sut = locator.repository
        let model = LoginModel(userName: "", password: "")

        sut.codableHelper = CodableMock()
        sut.executeLogin(with: model) { (token, error) in
            XCTAssertNil(token)
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.localizedDescription, CustomError().localizedDescription)
        }
    }
}
