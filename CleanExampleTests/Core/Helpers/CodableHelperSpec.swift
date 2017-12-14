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
    
    func testExample() {
    }
}
