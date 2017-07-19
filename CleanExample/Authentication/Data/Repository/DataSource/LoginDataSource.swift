//
//  LoginDataSource.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

protocol LoginDataSource {
    // swiftlint:disable type_name
    associatedtype T
    // swiftlint:enable type_name
    func loginUser(withCredentials userName: String, password: String,
                   onSuccess: @escaping (T) -> Void,
                   onError: @escaping (CustomError) -> Void)
}
