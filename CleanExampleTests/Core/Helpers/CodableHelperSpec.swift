//
//  CodableHelperSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 13-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class CodableHelperSpec: XCTestCase {
    var sut: CodableHelper!
    override func setUp() {
        super.setUp()
        sut = CodableHelper()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testCanDecodeObjectFromObject() {
        let model = LoginModel(userName: "Lala", password: "lalo")

        if let entity: LoginEntity = sut.decodeObjectFrom(object: model) {
            XCTAssertNotNil(entity)
        } else {
            XCTFail("Failed to create Entity")
        }
    }

    func testDecodeObjectFormObjectFails() {
        let model = LoginModel(userName: "Lala", password: "lalo")

        if let _: TokenEntity = sut.decodeObjectFrom(object: model) {
            XCTFail("Should not be capable of creating Entity")
        }
    }

    func testCanDecodeNetworkObjectFromObject() {
        let data = readJSONData(fileName: "LoginEntityData")

        if let entity: LoginEntity = sut.decodeNetworkObject(object: data) {
            XCTAssertNotNil(entity)
        } else {
            XCTFail("Failed to create Entity")
        }
    }

    func testDecodeNetworkObjectFormObjectFails() {
        let data = readJSONData(fileName: "LoginEntityData")

        if let _: TokenEntity = sut.decodeNetworkObject(object: data) {
            XCTFail("Should not be capable of creating Entity")
        }
    }
}
