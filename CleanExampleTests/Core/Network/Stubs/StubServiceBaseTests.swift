//
//  StubServiceBaseTests.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 13-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample

class StubServiceBaseTests: XCTestCase {
    var sut = StubServiceBase()
    
    func testBaseCanReadJSON() {
        let data = sut.readJSON(fileName: "LoginEntityData")
        XCTAssertNotNil(data)
    }

    func testBaseReturnsData() {
        let data = sut.readJSONData(fileName: "LoginEntityData")
        XCTAssertNotNil(data)
    }

    func testBaseReturnsNilWhenFileIsNotFound() {
        let data = sut.readJSON(fileName: "notAFile")
        XCTAssertNil(data)
    }
}
