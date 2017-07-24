//
//  HomeViewController.swift
//  CleanExample
//
//  Created by Felipe Ruz on 24-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeViewController: HomeViewProtocol {
    func displayUserInformation(user: User) {
        //TODO: Displays user header
    }
}
