//
//  LoginRestApi.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

protocol LoginRestApi {
    func loginUser(withCredentials userName: String, password: String,
                   onSuccess: @escaping (UserEntity, String) -> Void,
                   onError: @escaping (CustomError) -> Void)
}
