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
        loginPresenter?.attachView(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onLoginButtonTap(_ sender: Any) {
        loginPresenter?.doLogin(userName.text!, password: userPassword.text!)
    }
}

extension LoginViewController: LoginViewProtocol {
    func showActivityIndicator() {

    }

    func hideActivityIndicator() {

    }

    func showErrorMessage(_ error: CustomError) {
        let alert = UIAlertController(title: error.localizedTitle,
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(aceptar)
        present(alert, animated: true, completion: nil)
    }
}
