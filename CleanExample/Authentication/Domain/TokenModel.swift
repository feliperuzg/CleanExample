//
//  TokenModel.swift
//  CleanExample
//
//  Created by Felipe Ruz on 12-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

struct TokenModel: Codable {
    let token: String

    private enum CodingKeys: String, CodingKey {
        case token
    }
}
