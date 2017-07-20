//
//  LoginUseCase.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

struct LoginUseCase {
    let repository: LoginRepositoryProtocol
    let storageRepository: StorageRepositoryProtocol

    func loginUser(withCredentials userName: String, password: String,
                   onSuccess: @escaping (User) -> Void,
                   onError: @escaping (CustomError) -> Void) {
        repository.loginUser(withCredentials: userName, password: password, onSuccess: { (user, token) in
            self.storageRepository.saveAuthToken(token)
            onSuccess(user)
        }) { (error) in
            onError(error)
        }
    }
}
