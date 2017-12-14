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

    let networkConfiguration = NetworkConfiguration()

    func readJSON(fileName: String) -> [String: AnyObject] {
        let data = readJSONData(fileName: fileName)
        if
            let json = try? JSONSerialization.jsonObject(with: data, options: [.allowFragments]),
            let object = json as? [String: AnyObject] {
            return object
        } else {
            fatalError("Could not read from file \(fileName)")
        }
    }

    func readJSONData(fileName: String) -> Data {
        let testBundle = Bundle(for: type(of: self))
        if
            let fileURL = testBundle.url(forResource: fileName, withExtension: Defaults.defaultExtension),
            let data = try? Data(contentsOf: fileURL) {
            return data
        } else {
            fatalError("Could not read Data from file \(fileName)")
        }
    }

    func addStub(url: String, fileName: String, method: HTTPMethod) {
        let data = readJSON(fileName: fileName)
        MockingjayProtocol.addStub(matcher: http(method, uri: url), delay: 1, builder: json(data, status: 200))
    }
}
