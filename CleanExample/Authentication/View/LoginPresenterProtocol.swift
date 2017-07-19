//
//  File.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol {
    func doLogin(_ user: String, password: String)
    func attachView(_ loginView: LoginViewProtocol)
}
