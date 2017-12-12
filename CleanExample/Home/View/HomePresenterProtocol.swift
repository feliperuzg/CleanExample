//
//  HomePresenterProtocol.swift
//  CleanExample
//
//  Created by Felipe Ruz on 24-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

protocol HomePresenterProtocol {
    func attachView(_ homeView: HomeViewProtocol)
    func getContacts(
        onSuccess: @escaping ([Any]) -> Void,
        onError: @escaping (CustomError) -> Void
    )
}
