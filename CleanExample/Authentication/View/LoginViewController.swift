//
//  LoginViewController.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    let locator = LoginServiceLocator()
    var loginPresenter: LoginPresenterProtocol?

    convenience init(_ presenter: LoginPresenterProtocol) {
        self.init()
        loginPresenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onLoginButtonTap(_ sender: Any) {
    }
}

extension LoginViewController: LoginViewProtocol {
    func showActivityIndicator() {

    }

    func hideActivityIndicator() {

    }

    func showErrorMessage(_ error: CustomError) {

    }
}

extension LoginViewController: LoginPresenterProtocol {
    func doLogin(_ user: String, password: String) {

    }
}
