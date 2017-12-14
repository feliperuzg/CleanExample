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

    func readJSON(fileName: String) -> [String: AnyObject]? {
        if
            let data = readJSONData(fileName: fileName),
            let json = try? JSONSerialization.jsonObject(with: data, options: [.allowFragments]),
            let object = json as? [String: AnyObject] {
            return object
        }
        return nil
    }

    func readJSONData(fileName: String) -> Data? {
        let testBundle = Bundle(for: type(of: self))
        if
            let fileURL = testBundle.url(forResource: fileName, withExtension: Defaults.defaultExtension),
            let data = try? Data(contentsOf: fileURL) {
            return data
        }
        return nil
    }

    func addStub(url: String?, fileName: String, method: HTTPMethod) {
        if let data = readJSON(fileName: fileName), let url = url {
            MockingjayProtocol.addStub(matcher: http(method, uri: url), delay: 1, builder: json(data, status: 200))
        }
    }
}
