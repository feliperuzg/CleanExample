//
//  UserDefaultsStorageDataSource.swift
//  CleanExample
//
//  Created by Felipe Ruz on 20-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class UserDefaultsStorageDataSource: StorageDataSource {
    let storage = UserDefaults.standard

    func saveAuthToken(_ token: String) {
        storage.set(token, forKey: "token")
    }

    func getAuthToken(_ onSuccess: @escaping (String) -> Void) {
        // swiftlint:disable force_cast
        let token = storage.value(forKey: "token") as! String
        onSuccess(token)
    }
}
