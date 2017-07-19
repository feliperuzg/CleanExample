//
//  LoginRepository.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

struct LoginRepository<T: LoginDataSource>: LoginRepositoryProtocol where T.T == UserEntity {
    let datasource: T

    func loginUser(withCredentials userName: String, password: String,
                   onSuccess: @escaping (User) -> Void,
                   onError: @escaping (CustomError) -> Void) {

    }
}
