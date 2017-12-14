//
//  AuthenticationRepositoryProtocol.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

protocol AuthenticationRepositoryProtocol {
    var codableHelper: CodableHelper { get set }
    func executeLogin(with credentials: LoginModel, completionHandler: @escaping (TokenModel?, CustomError?) -> Void)
}
