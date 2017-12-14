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
        guard
            let urlString = networkConfiguration.authenticationURL(for: .login),
            let url = URL(string: urlString) else {
                XCTFail("Failed to create url or request")
                return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.description
        XCTAssertTrue(MockingjayProtocol.canInit(with: request))
    }
}

