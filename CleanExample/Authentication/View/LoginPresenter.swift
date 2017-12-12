//
//  LoginPresenter.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import UIKit

class LoginPresenter: LoginPresenterProtocol {
    fileprivate let loginService: AuthenticationUseCase
    fileprivate weak var loginView: LoginViewProtocol?

    init(_ loginService: AuthenticationUseCase) {
        self.loginService = loginService
    }

    func attachView(_ loginView: LoginViewProtocol) {
        self.loginView = loginView
    }

    func doLogin(_ user: String, password pass: String) {
        loginView?.showActivityIndicator()
        let model = LoginModel(userName: user, password: pass)
        loginService.executeLogin(withm: model) { token, error in
            self.loginView?.hideActivityIndicator()
            if let token = token {
                print(token.address)
            } else {
                self.loginView?.showErrorMessage(error!)
            }
        }
    }
}
