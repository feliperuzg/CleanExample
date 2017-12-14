//
//  StubService.swift
//  CleanExample
//
//  Created by Felipe Ruz on 13-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class StubService {
    class func stubAll() {
        let authentication = StubAthenticationService()

        authentication.stubAll()
    }
}
