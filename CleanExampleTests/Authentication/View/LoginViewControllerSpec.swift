//
//  LoginViewControllerSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample

class MockPresenter: LoginPresenter {
    var doLoginCalled = false
    override func doLogin(_ user: String, password pass: String) {
        doLoginCalled = true
    }
}

class LoginViewControllerSpec: XCTestCase {
    var sut: LoginViewController!
    override func setUp() {
        super.setUp()
        sut = LoginViewController()
        sut.loadView()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testViewDisplaysIndicatorView() {
        XCTAssertFalse(sut.activityIndicator.isAnimating)
        sut.showActivityIndicator()
        XCTAssertTrue(sut.activityIndicator.isAnimating)
    }

    func testViewCanHideIndicatorView() {
        sut.showActivityIndicator()
        XCTAssertTrue(sut.activityIndicator.isAnimating)
        sut.hideActivityIndicator()
        XCTAssertFalse(sut.activityIndicator.isAnimating)
    }

    func testViewShowsAlertController() {
        XCTAssertNil(sut.alert)
        let error = CustomError(localizedDescription: "desc", code: 400)
        sut.showErrorMessage(error)
        XCTAssertNotNil(sut.alert)
        XCTAssertEqual(sut.alert.message, error.localizedDescription)
    }

    func testLoginButtonCallsPresenter() {
        let locator = AuthenticationServiceLocator()
        let presenter = MockPresenter(locator.useCases)
        sut = LoginViewController(presenter)
        sut.loadView()

        sut.onLoginButtonTap((Any).self)
        XCTAssertTrue(presenter.doLoginCalled)
    }
}
