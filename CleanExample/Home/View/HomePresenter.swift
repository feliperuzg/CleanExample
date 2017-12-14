//
//  HomePresenter.swift
//  CleanExample
//
//  Created by Felipe Ruz on 24-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    fileprivate weak var homeView: HomeViewProtocol?

    func attachView(_ homeView: HomeViewProtocol) {
        self.homeView = homeView
    }

    func getUserInformation() {
        homeView?.displayUserInformation(user: "Felipe")
    }
}
