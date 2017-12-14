//
//  AuthenticationDataSource.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

protocol AuthenticationDataSource {
    func executeLogin(with credentials: LoginEntity, completionHandler: @escaping (TokenEntity?, CustomError?) -> Void)
}
