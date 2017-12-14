//
//  StorageDataSource.swift
//  CleanExample
//
//  Created by Felipe Ruz on 20-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

protocol StorageDataSource {
    func saveAuthToken(_ token: String)
    func authToken() -> String
}
