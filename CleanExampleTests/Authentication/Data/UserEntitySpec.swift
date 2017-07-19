//
//  UserEntitySpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class UserEntitySpec: XCTestCase {

    let dictionary = ["firstName": "Juan",
                      "lastName": "Perez",
                      "age": 20,
                      "phone": "123456789",
                      "email": "example@domain.com",
                      "address": "Any Street #123"] as [String : Any]
    override func setUp() {
        super.setUp()
    }

    func testCanCreateEntityFormDictionary() {
        let sut = UserEntity(fromDictionary: dictionary)
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.firstName, "Juan")
    }
}
