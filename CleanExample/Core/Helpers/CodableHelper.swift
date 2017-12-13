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
    func decodeObjectFrom<E: Encodable, D: Decodable>(object: E) -> D {
        do {
            let data = try encoder.encode(object)
            let target = try decoder.decode(D.self, from: data)
            return target
        } catch {
            fatalError("Could not transform object of class \(D.self)")
        }
    }

    func decodeNetworkObject<D: Decodable>(object: Data) throws -> D {
        do {
            let target = try decoder.decode(D.self, from: object)
            return target
        } catch {
            throw error
        }
    }

    func decodeStringObject<D: Decodable>(object: String) -> D {
        guard let data = object.data(using: .utf8) else {
            fatalError("Could not encode object: \(object)")
        }
        do {
            let target: D = try decodeNetworkObject(object: data)
            return target
        } catch {
            fatalError("Could not transform object of class \(D.self)")
        }
    }
}
