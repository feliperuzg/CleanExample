//
//  AuthenticationDataSource.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

protocol AuthenticationDataSource: class {
    // swiftlint:disable type_name
    associatedtype T
    // swiftlint:enable type_name
    func executeLogin(withCredentials userName: String, password: String,
                      onSuccess: @escaping (T, String) -> Void,
                      onError: @escaping (CustomError) -> Void)
}
