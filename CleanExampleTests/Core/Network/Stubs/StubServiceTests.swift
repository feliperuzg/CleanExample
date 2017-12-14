//
//  StubServiceTests.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 13-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
import Mockingjay
@testable import CleanExample

class StubServiceTests: XCTestCase {
    var networkConfiguration: NetworkConfiguration!

    override func setUp() {
        super.setUp()
        networkConfiguration = NetworkConfiguration()
    }

    override func tearDown() {
        networkConfiguration = nil
        removeAllStubs()
        super.tearDown()
    }

    func testAssertStubOAuthService() {
        let url = networkConfiguration.authenticationURL(for: .login)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethod.post.description
        XCTAssertTrue(MockingjayProtocol.canInit(with: request))
    }
}

