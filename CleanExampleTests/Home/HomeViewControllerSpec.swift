//
//  HomeViewControllerSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 13-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample

class HomePresenterMock: HomePresenter {
    var getUserInformationCalled = false

    override func getUserInformation() {
        getUserInformationCalled = true
    }
}

class HomeViewControllerSpec: XCTestCase {
    var sut: HomeViewController!
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testViewCanInitialize() {
        sut = HomeViewController(HomePresenter())

        XCTAssertNotNil(sut)
    }

    func testHomeViewCycle() {
        let presenter = HomePresenterMock()
        sut = HomeViewController(presenter)

        sut.viewDidLoad()

        XCTAssertEqual(sut.title, "Home")
        
        sut.viewWillAppear(false)

        XCTAssertTrue(presenter.getUserInformationCalled)
    }

    func testHomeViewChangesName() {
        sut = HomeViewController(HomePresenter())

        sut.loadView()

        sut.displayUserInformation(user: "Lala")

        XCTAssertEqual(sut.userLabel.text, "Lala")
    }
}
