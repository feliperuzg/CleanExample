//
//  LoginPresenter.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import UIKit

class LoginPresenter: LoginPresenterProtocol {
    fileprivate let loginService: LoginUseCase
    weak fileprivate var loginView: LoginViewProtocol?

    init(_ loginService: LoginUseCase) {
        self.loginService = loginService
    }

    func attachView(_ loginView: LoginViewProtocol) {
        self.loginView = loginView
    }

    func doLogin(_ user: String, password pass: String) {
        self.loginView?.showActivityIndicator()
        loginService.loginUser(withCredentials: user, password: pass, onSuccess: { [weak self] user in
            self?.loginView?.hideActivityIndicator()
        }) { [weak self] error in
            self?.loginView?.hideActivityIndicator()
            self?.loginView?.showErrorMessage(error)
        }
    }
}
