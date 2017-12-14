//
//  HomeViewController.swift
//  CleanExample
//
//  Created by Felipe Ruz on 24-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel!

    private var homePresenter: HomePresenterProtocol?

    convenience init(_ presenter: HomePresenterProtocol) {
        self.init()
        homePresenter = presenter
        homePresenter?.attachView(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        homePresenter?.getUserInformation()
    }
}

extension HomeViewController: HomeViewProtocol {
    func displayUserInformation(user: String) {
        userLabel.text = user
    }
}
