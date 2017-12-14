//
//  AuthenticationMockApi.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation
import Alamofire

class AuthenticationMockApi: AuthenticationRestApi {

    let networkConfiguration: NetworkConfiguration

    init(networkConfiguration: NetworkConfiguration) {
        self.networkConfiguration = networkConfiguration
    }

    func executeLogin(
        with credentials: LoginEntity,
        completionHandler: @escaping (TokenEntity?, CustomError?) -> Void
    ) {
        let url = networkConfiguration.authenticationURL(for: .login)
        let params: Parameters = [
            "userName": credentials.userName,
            "password": credentials.password
        ]
        AlamofireSession.execute(url, .post, params) { response in
            if
                let data = response.data,
                let token: TokenEntity = try? CodableHelper().decodeNetworkObject(object: data),
                !credentials.userName.isEmpty,
                !credentials.password.isEmpty {
                completionHandler(token, nil)
            } else {
                let error = CustomError(localizedTitle: "Error", localizedDescription: "User or password incorrect", code: 400)
                completionHandler(nil, error)
            }
        }
    }
}
