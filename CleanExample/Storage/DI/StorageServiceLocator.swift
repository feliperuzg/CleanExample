//
//  StorageServiceLocator.swift
//  CleanExample
//
//  Created by Felipe Ruz on 20-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class StorageServiceLocator {

    var dataSource: StorageDataSource {
        return UserDefaultsStorageDataSource()
    }

    var repository: StorageRepositoryProtocol {
        return UserDefaultsRepository(datasource: dataSource)
    }
}
