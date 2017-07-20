//
//  LoginRepositoryProtocol.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

protocol LoginRepositoryProtocol {
    func loginUser(withCredentials userName: String, password: String,
                   onSuccess: @escaping (User, String) -> Void,
                   onError: @escaping (CustomError) -> Void)
}
