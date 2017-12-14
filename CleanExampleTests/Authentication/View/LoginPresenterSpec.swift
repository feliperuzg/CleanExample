//
//  LoginPresenterSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample

class LoginViewMock: NSObject, LoginViewProtocol {
    var showActivityCalled = false
    var hideActivityCalled = false
    var showErrorCalled = false

    func showActivityIndicator() {
        showActivityCalled = true
    }

    func hideActivityIndicator() {
        hideActivityCalled = true
    }

    func showErrorMessage(_ error: CustomError) {
        showErrorCalled = true
    }
}

class AuthenticationApiMock: AuthenticationMockApi {
    override func executeLogin(with credentials: LoginEntity, completionHandler: @escaping (TokenEntity?, CustomError?) -> Void) {
        if credentials.userName.isEmpty || credentials.password.isEmpty {
            completionHandler(nil, CustomError(localizedDescription: "Error", code: 400))
        } else {
            completionHandler(TokenEntity(token: "123123"), nil)
        }
    }
}

class MockServiceLocator: AuthenticationServiceLocator {
    override var restApi: AuthenticationRestApi {
        return AuthenticationApiMock(networkConfiguration: NetworkConfiguration())
    }
}

class LoginPresenterSpec: XCTestCase {
    var sut: LoginPresenterProtocol!
    let locator = AuthenticationServiceLocator()
    let fakeLocator = MockServiceLocator()

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testPresenterCanInitilize() {
        sut = LoginPresenter(locator.useCases)
        XCTAssertNotNil(sut)
    }

    func testPresenterCalldoLogin() {
        sut = LoginPresenter(locator.useCases)
        let viewController = LoginViewMock()
        sut.attachView(viewController)

        sut.doLogin("Juan", password: "1234")

        XCTAssertTrue(viewController.showActivityCalled)
    }

    func testPresenterHidesIndicatorView() {
        sut = LoginPresenter(fakeLocator.useCases)
        let viewController = LoginViewMock()
        sut.attachView(viewController)

        sut.doLogin("", password: "")

        XCTAssertTrue(viewController.hideActivityCalled)
    }

    func testPresenterDisplaysAlertViewOnError() {
        sut = LoginPresenter(fakeLocator.useCases)
        let viewController = LoginViewMock()
        sut.attachView(viewController)

        sut.doLogin("", password: "")

        XCTAssertTrue(viewController.showErrorCalled)
    }
}
