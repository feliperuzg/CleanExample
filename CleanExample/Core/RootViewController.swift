//
//  RootViewController.swift
//  CleanExample
//
//  Created by Felipe Ruz on 20-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import UIKit

class RootViewController: UINavigationController {
    let authenticationLocator = AuthenticationServiceLocator()
    var loginView: LoginViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        showLogin()
    }

    func showLogin() {
        let presenter = LoginPresenter(authenticationLocator.useCases)
        loginView = LoginViewController(presenter)
        pushViewController(loginView, animated: true)
    }
}
