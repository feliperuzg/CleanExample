//
//  CodableHelper.swift
//  CleanExample
//
//  Created by Felipe Ruz on 12-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation
class CodableHelper {

    let decoder = JSONDecoder()
    let encoder = JSONEncoder()

    func decodeObjectFrom<E: Encodable, D: Decodable>(object: E) -> D? {
        if let data = try? encoder.encode(object), let target = try? decoder.decode(D.self, from: data) {
            return target
        }
        return nil
    }

    func decodeNetworkObject<D: Decodable>(object: Data) -> D? {
        if let target = try? decoder.decode(D.self, from: object) {
            return target
        }
        return nil
    }
}
