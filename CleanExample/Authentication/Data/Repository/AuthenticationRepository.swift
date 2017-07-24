//
//  AuthenticationRepository.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

struct AuthenticationRepository<T: AuthenticationDataSource>: AuthenticationRepositoryProtocol where T.T == UserEntity {
    let datasource: T

    func executeLogin(withCredentials userName: String, password: String,
                   onSuccess: @escaping (User, String) -> Void,
                   onError: @escaping (CustomError) -> Void) {
        datasource.executeLogin(withCredentials: userName, password: password, onSuccess: { (entity, token) in
            onSuccess(NewUser(fromEntity: entity), token)
        }) { (error) in
            onError(error)
        }
    }
}
