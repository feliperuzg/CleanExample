//
//  LoginMockApi.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class LoginMockApi: LoginRestApi {
    let response = ["firstName": "Juan",
                    "lastName": "Perez",
                    "age": 20,
                    "phone": "12345678",
                    "email": "example@domain.com",
                    "address": "Any Street #123"] as [String : Any]
    let error = CustomError(localizedTitle: "BAD REQUEST", localizedDescription: "BAD REQUEST", code: 400)

    func loginUser(withCredentials userName: String, password: String,
                   onSuccess: @escaping (UserEntity) -> Void,
                   onError: @escaping (CustomError) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if userName.isEmpty || password.isEmpty {
                onError(self.error)
            } else {
                onSuccess(UserEntity(fromDictionary: self.response))
            }
        }
    }
}
