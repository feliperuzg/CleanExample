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
    weak fileprivate var homeView: HomeViewProtocol?

    init(_ homeService: NSObject) {
        self.homeService = homeService
    }

    func attachView(_ homeView: HomeViewProtocol) {
        self.homeView = homeView
    }

    func getContacts(onSuccess: @escaping ([Any]) -> Void,
                     onError: @escaping (CustomError) -> Void) {
        
    }
}
