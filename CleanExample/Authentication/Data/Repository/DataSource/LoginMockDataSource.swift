//
//  LoginMockDataSource.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class LoginMockDataSource: LoginDataSource {
    let restApi: LoginRestApi

    init(restApi: LoginRestApi) {
        self.restApi = restApi
    }

    func loginUser(withCredentials userName: String, password: String,
                   onSuccess: @escaping (UserEntity) -> Void,
                   onError: @escaping (CustomError) -> Void) {
        restApi.loginUser(withCredentials: userName, password: password, onSuccess: { (entity) in
            onSuccess(entity)
        }) { (error) in
            onError(error)
        }
    }
}