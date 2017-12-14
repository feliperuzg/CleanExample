//
//  UserDefaultsRepository.swift
//  CleanExample
//
//  Created by Felipe Ruz on 20-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

struct UserDefaultsRepository: StorageRepositoryProtocol {
    let datasource: StorageDataSource

    init(datasource: StorageDataSource) {
        self.datasource = datasource
    }

    func saveAuthToken(_ token: String) {
        datasource.saveAuthToken(token)
    }

    func authToken() -> String {
        return datasource.authToken()
    }
}
