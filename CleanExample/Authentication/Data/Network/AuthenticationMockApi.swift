//
//  AuthenticationMockApi.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class AuthenticationMockApi: AuthenticationRestApi {

    let networkConfiguration: NetworkConfiguration

    init(networkConfiguration: NetworkConfiguration) {
        self.networkConfiguration = networkConfiguration
    }

    func executeLogin(
        with credentials: LoginEntity,
        completionHandler: @escaping (TokenEntity?, CustomError?) -> Void
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if credentials.userName.isEmpty || credentials.password.isEmpty {
                completionHandler(nil, CustomError(localizedTitle: "", localizedDescription: "", code: 400))
            } else {
                let entity: TokenEntity = TokenEntity(token: "1234567890")
                completionHandler(entity, nil)
            }
        }
    }
}
