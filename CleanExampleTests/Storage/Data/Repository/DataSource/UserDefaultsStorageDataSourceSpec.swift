//
//  UserDefaultsStorageDataSourceSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 20-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class UserDefaultsStorageDataSourceSpec: XCTestCase {
    let locator = StorageServiceLocator()
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: "token")
    }

    func testDatasourceCanStoreToken() {
        let sut = locator.dataSource
        sut.saveAuthToken("1234")
        // swiftlint:disable force_cast
        let token = UserDefaults.standard.value(forKey: "token") as! String
        // swiftlint:enable force_cast
        XCTAssertEqual(token, "1234")
    }

    func testDataSourceCanReadToken() {
        let sut = locator.dataSource
        UserDefaults.standard.set("4321", forKey: "token")
        XCTAssertEqual(sut.authToken(), "4321")
    }
}
