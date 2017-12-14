//
//  CustomErrorSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class CustomErrorSpec: XCTestCase {

    let title = "Title"
    let desc = "description"
    let code = 400

    func testCanCreateCustomErrorWithoutTitle() {
        let error = CustomError(localizedDescription: desc, code: code)
        XCTAssertNotNil(error)
        XCTAssertEqual(error.code, code)
        XCTAssertEqual(error.localizedTitle, "Error")
        XCTAssertEqual(error.localizedDescription, desc)
    }

    func testCanCreateCustomErrorWithTitle() {
        let error = CustomError(localizedTitle: title, localizedDescription: desc, code: code)
        XCTAssertNotNil(error)
        XCTAssertEqual(error.code, code)
        XCTAssertEqual(error.localizedTitle, title)
        XCTAssertEqual(error.localizedDescription, desc)
    }

    func testCanCreateErrorWithDefaultValues() {
        let error = CustomError()
        XCTAssertNotNil(error)
        XCTAssertEqual(error.code, 500)
        XCTAssertEqual(error.localizedTitle, "Error")
        XCTAssertEqual(error.localizedDescription, "No podemos atender su solicitud en estos momentos")
    }
}
