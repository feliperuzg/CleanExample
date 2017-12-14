//
//  AuthenticationRepository.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

struct AuthenticationRepository: AuthenticationRepositoryProtocol {

    let datasource: AuthenticationDataSource

    init(datasource: AuthenticationDataSource) {
        self.datasource = datasource
    }

    func executeLogin(with credentials: LoginModel, completionHandler: @escaping (TokenModel?, CustomError?) -> Void) {
        if let entity: LoginEntity = CodableHelper().decodeObjectFrom(object: credentials) {
            datasource.executeLogin(with: entity) { token, error in
                if let token = token, let model: TokenModel = CodableHelper().decodeObjectFrom(object: token) {
                    completionHandler(model, nil)
                } else {
                    completionHandler(nil, error)
                }
            }
        } else {
            completionHandler(nil, CustomError())
        }
    }
}
