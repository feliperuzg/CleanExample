//
//  LoginMockDataSourceSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class LoginMockDataSourceSpec: XCTestCase {
    let locator = LoginServiceLocator()
    
    func testLoginDataSourceCanReturnEntity() {
        let sut = locator.dataSource
        sut.loginUser(withCredentials: "Juan", password: "1234", onSuccess: { (entity) in
            XCTAssertNotNil(entity)
        }) { (error) in
            XCTFail(error.localizedDescription)
        }
    }

    func testLoginDataSourceCanReturnError() {
        let sut = locator.dataSource
        sut.loginUser(withCredentials: "", password: "", onSuccess: { (entity) in
            XCTFail()
        }) { (error) in
            XCTAssertNotNil(error)
        }
    }
}
