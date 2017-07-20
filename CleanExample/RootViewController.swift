//
//  RootViewController.swift
//  CleanExample
//
//  Created by Felipe Ruz on 20-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import UIKit

class RootViewController: UINavigationController {
    let loginLocator = LoginServiceLocator()
    var loginView: LoginViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        showLogin()
    }

    func showLogin() {
        let presenter = LoginPresenter(loginLocator.useCases)
        loginView = LoginViewController(presenter)
        loginView.view.frame = UIScreen.main.bounds
        addChildViewController(loginView)
        view.addSubview(loginView.view)
    }
}
