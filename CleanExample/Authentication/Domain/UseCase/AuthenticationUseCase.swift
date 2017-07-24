//
//  AuthenticationUseCase.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

struct AuthenticationUseCase {
    let repository: AuthenticationRepositoryProtocol
    let storageRepository: StorageRepositoryProtocol

    func executeLogin(withCredentials userName: String, password: String,
                      onSuccess: @escaping (User) -> Void,
                      onError: @escaping (CustomError) -> Void) {
        repository.executeLogin(withCredentials: userName, password: password, onSuccess: { (user, token) in
            self.storageRepository.saveAuthToken(token)
            onSuccess(user)
        }) { (error) in
            onError(error)
        }
    }
}
