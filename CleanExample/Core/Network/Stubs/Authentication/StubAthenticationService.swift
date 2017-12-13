//
//  StubAthentication.swift
//  CleanExample
//
//  Created by Felipe Ruz on 13-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class StubAthenticationService: StubServiceBase {
    func stubAll() {
        stubAuthorize()
    }

    private func stubAuthorize() {
        let url = networkConfiguration.authenticationURL(for: .login)
        addStub(url: url, fileName: #function, method: .post)
    }
}
