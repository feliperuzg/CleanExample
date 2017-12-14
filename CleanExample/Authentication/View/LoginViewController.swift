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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicatorContainer: UIView!
    fileprivate let locator = AuthenticationServiceLocator()
    fileprivate var loginPresenter: LoginPresenterProtocol?
    var alert: UIAlertController!

    convenience init(_ presenter: LoginPresenterProtocol) {
        self.init()
        loginPresenter = presenter
        loginPresenter?.attachView(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @IBAction func onLoginButtonTap(_: Any) {
        view.endEditing(true)
        if let user = userName.text, let pass = userPassword.text {
            loginPresenter?.doLogin(user, password: pass)
        }
    }
}

extension LoginViewController: LoginViewProtocol {
    func showActivityIndicator() {
        activityIndicatorContainer.isHidden = false
        activityIndicator.startAnimating()
    }

    func hideActivityIndicator() {
        activityIndicatorContainer.isHidden = true
        activityIndicator.stopAnimating()
    }

    func showErrorMessage(_ error: CustomError) {
        alert = UIAlertController(
            title: error.localizedTitle,
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(aceptar)
        present(alert, animated: true, completion: nil)
    }
}
