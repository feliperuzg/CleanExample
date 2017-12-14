//
//  NetworkConfigurationSpec.swift
//  CleanExampleTests
//
//  Created by Felipe Ruz on 13-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import XCTest
@testable import CleanExample
class NetworkConfigurationSpec: XCTestCase {
    var sut: NetworkConfiguration!
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testNetworkConfigiurationReturnsURL() {
        sut = NetworkConfiguration()
        let url = sut.authenticationURL(for: .login)

        XCTAssertNotNil(url)
    }

    func testNetworkConfigurationReturnsNil() {
        sut = NetworkConfiguration()
        sut.networkConfigurationList = "none"
        sut.prepare()
        
        let url = sut.authenticationURL(for: .login)

        XCTAssertNil(url)
    }
}
