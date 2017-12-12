//
//  HomePresenter.swift
//  CleanExample
//
//  Created by Felipe Ruz on 24-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    fileprivate let homeService: NSObject
    fileprivate weak var homeView: HomeViewProtocol?

    init(_ homeService: NSObject) {
        self.homeService = homeService
    }

    func attachView(_ homeView: HomeViewProtocol) {
        self.homeView = homeView
    }

    func getContacts(
        onSuccess _: @escaping ([Any]) -> Void,
        onError _: @escaping (CustomError) -> Void
    ) {
    }
}
