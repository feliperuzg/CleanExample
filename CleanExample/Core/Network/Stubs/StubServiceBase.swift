//
//  File.swift
//  CleanExample
//
//  Created by Felipe Ruz on 13-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation
import Mockingjay

class StubServiceBase {
    struct Defaults {
        static let defaultExtension = "json"
    }

    enum DataType {
        case dictionary
        case array
    }

    let networkConfiguration = NetworkConfiguration()

    func readJSON(fileName: String!) -> [String: AnyObject] {
        let data = readJSONData(fileName: fileName)
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
            guard let object = json as? [String: AnyObject] else {
                fatalError("Could not serialize file into Dictionary")
            }
            return object
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func readJSONArray(fileName: String!) -> [AnyObject] {
        let data = readJSONData(fileName: fileName)
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
            guard let object = json as? [AnyObject] else {
                fatalError("Could not serialize file into Array")
            }
            return object
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func readJSONData(fileName: String!) -> Data {
        let testBundle = Bundle(for: type(of: self))
        if let fileURL = testBundle.url(forResource: fileName, withExtension: Defaults.defaultExtension) {
            do {
                let data = try Data(contentsOf: fileURL)
                return data
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("File: \(fileName), not found un Bundle")
        }
    }

    func addStub(url: String, fileName: String, method: HTTPMethod, dataType: DataType? = nil, code: Int? = nil) {
        let data = readData(dataType: dataType ?? .dictionary, fileName: fileName)
        MockingjayProtocol.addStub(matcher: http(method, uri: url), delay: 1, builder: json(data, status: code ?? 200))
    }

    private func readData(dataType: DataType, fileName: String) -> Any {
        switch dataType {
        case .array:
            return readJSONArray(fileName: fileName)
        case .dictionary:
            return readJSON(fileName: fileName)
        }
    }
}
