//
//  LoginEntity.swift
//  CleanExample
//
//  Created by Felipe Ruz on 12-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

struct LoginEntity: Codable {
    let userName: String
    let password: String

    private enum CodingKeys: String, CodingKey {
        case userName
        case password
    }
}
