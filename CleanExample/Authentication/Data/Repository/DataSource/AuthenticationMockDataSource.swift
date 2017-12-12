//
//  AuthenticationMockDataSource.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class AuthenticationMockDataSource: AuthenticationDataSource {

    var restApi: AuthenticationRestApi

    init(restApi: AuthenticationRestApi) {
        self.restApi = restApi
    }

    func executeLogin(
        with credentials: LoginEntity,
        completionHandler: @escaping (TokenEntity?, CustomError?) -> Void
    ) {
        restApi.executeLogin(with: credentials) { user, error in
            completionHandler(user, error)
        }
    }
}
