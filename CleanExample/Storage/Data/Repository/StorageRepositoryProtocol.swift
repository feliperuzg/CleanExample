//
//  StorageRepositoryProtocol.swift
//  CleanExample
//
//  Created by Felipe Ruz on 20-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

protocol StorageRepositoryProtocol {
    func saveAuthToken(_ token: String)
    func getAuthToken(_ onSuccess: @escaping (String) -> Void)
}
