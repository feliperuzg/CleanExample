//
//  LoginModel.swift
//  CleanExample
//
//  Created by Felipe Ruz on 12-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

struct LoginModel: Codable {
    let userName: String
    let password: String

    private enum CodingKeys: String, CodingKey {
        case userName
        case password
    }
}
