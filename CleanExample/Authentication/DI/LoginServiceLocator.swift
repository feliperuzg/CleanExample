//
//  LoginServiceLocator.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class LoginServiceLocator {

    var restApi: LoginRestApi {
        return LoginMockApi()
    }

    var dataSource: LoginMockDataSource {
        return LoginMockDataSource(restApi: restApi)
    }

    var repository: LoginRepositoryProtocol {
        return LoginRepository(datasource: dataSource)
    }

    var useCases: LoginUseCase {
        return LoginUseCase(repository: repository)
    }

}
