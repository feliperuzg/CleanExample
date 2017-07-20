//
//  UserDefaultsRepositorySpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 20-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class UserDefaultsRepositorySpec: XCTestCase {
    let locator = StorageServiceLocator()
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: "token")
    }
    
    func testRespositoryCanSaveToken() {
        let sut = locator.repository
        sut.saveAuthToken("0000")
        // swiftlint:disable force_cast
        let token = UserDefaults.standard.value(forKey: "token") as! String
        // swiftlint:enable force_cast

        XCTAssertEqual(token, "0000")
    }

    func testRespositoryCanReadToken() {
        let sut = locator.repository
        UserDefaults.standard.set("1111", forKey: "token")

        sut.getAuthToken { (token) in
            XCTAssertEqual(token, "1111")
        }
    }
}
