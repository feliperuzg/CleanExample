//
//  AuthenticationMockDataSource.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class AuthenticationMockDataSource: AuthenticationDataSource {
    let restApi: AuthenticationRestApi

    init(restApi: AuthenticationRestApi) {
        self.restApi = restApi
    }

    func executeLogin(withCredentials userName: String, password: String,
                      onSuccess: @escaping (UserEntity, String) -> Void,
                      onError: @escaping (CustomError) -> Void) {
        restApi.executeLogin(withCredentials: userName, password: password, onSuccess: { (entity, token) in
            onSuccess(entity, token)
        }) { (error) in
            onError(error)
        }
    }
}
