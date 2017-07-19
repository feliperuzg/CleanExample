//
//  LoginPresenterSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class LoginPresenterSpec: XCTestCase {
    var sut: LoginPresenterProtocol!
    let locator = LoginServiceLocator()
    override func setUp() {
        super.setUp()
        sut = LoginPresenter(locator.useCases)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func presenterCanInitilize() {
        XCTAssertNotNil(sut)
    }
}
