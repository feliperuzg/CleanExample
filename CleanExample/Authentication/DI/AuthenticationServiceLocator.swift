//
//  AuthenticationServiceLocator.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class AuthenticationServiceLocator {
    let storageLocator = StorageServiceLocator()
    var restApi: AuthenticationRestApi {
        return AuthenticationMockApi()
    }

    var dataSource: AuthenticationMockDataSource {
        return AuthenticationMockDataSource(restApi: restApi)
    }

    var repository: AuthenticationRepositoryProtocol {
        return AuthenticationRepository(datasource: dataSource)
    }

    var useCases: AuthenticationUseCase {
        return AuthenticationUseCase(repository: repository, storageRepository: storageLocator.repository)
    }
}
