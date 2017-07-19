//
//  LoginViewProtocol.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

protocol LoginViewProtocol: NSObjectProtocol {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showErrorMessage(_ error: CustomError)
}
