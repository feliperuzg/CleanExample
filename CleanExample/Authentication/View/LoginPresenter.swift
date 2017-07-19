//
//  LoginPresenter.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import UIKit

class LoginPresenter: LoginPresenterProtocol {
    fileprivate let loginService: LoginService
    weak fileprivate var loginView: LoginViewProtocol?

    init(loginService: LoginService) {
        self.loginService = loginService
    }

    func attachView(_ view: LoginViewProtocol) {
        loginView = view
    }

    func detachView() {
        loginView = nil
    }

    func doLogin(_ user: String, pass: String) {
//        loginService.
    }

//    func getUsers() {
//        self.userView?.startLoading()
//        userService.getUsers{ [weak self] users in
//            self?.userView?.finishLoading()
//            if(users.count == 0){
//                self?.userView?.setEmptyUsers()
//            }else{
//                let mappedUsers = users.map{
//                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
//                }
//                self?.userView?.setUsers(mappedUsers)
//            }
//
//        }
}
