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

    func executeLogin(withm credentials: LoginModel, completionHandler: @escaping (UserModel?, CustomError?) -> Void) {
        repository.executeLogin(with: credentials) { token, error in
            if let token = token {
                self.storageRepository.saveAuthToken(token.token)
            }
            let user: UserModel = CodableHelper().decodeObjectFrom(object: token)
            completionHandler(user, error)
        }
    }
}
