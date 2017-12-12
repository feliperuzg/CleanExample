//
//  NetworkConfiguration.swift
//  CleanExample
//
//  Created by Felipe Ruz on 12-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

class NetworkConfiguration: NSObject {
    private var configurationDictionary: [String: AnyObject]?
    private var defaultKey: String? = ""

    override init() {
        super.init()
        prepare()
    }

    func prepare() {
        prepareConfigurationDictionary()
    }

    /// Will read Configuration.plist and assing it to configurationDictionary property
    private func prepareConfigurationDictionary() {
        let bundle = Bundle(for: NetworkConfiguration.self)
        var format = PropertyListSerialization.PropertyListFormat.xml

        if
        let plistPath = bundle.path(
            forResource: NetworkConstants.fileExtension,
            ofType: NetworkConstants.fileExtension
            ),
        let plistData = FileManager.default.contents(atPath: plistPath),
        let dict = try? PropertyListSerialization.propertyList(
            from: plistData,
            options: .mutableContainersAndLeaves,
            format: &format
            ) as? [String: AnyObject],
        let key = defaultKey,
        let enviromentDict = dict?[key] as? [String: AnyObject] {
            configurationDictionary = enviromentDict
        } else {
            fatalError("""
                Could not get \(String(describing: defaultKey))
                from \(NetworkConstants.networkConfigurationList).\(NetworkConstants.fileExtension)
                """)
        }
    }

//    private func endpointFor(domain: Domain, endpoint: String, fullURL: Bool = true) -> String {
//        guard
//            let dict = configurationDictionary[domain.rawValue] as? [String: AnyObject],
//            let baseURL = dict[NetworkConstants.baseURL] as? String
//            else { fatalError("Could not find \(NetworkConstants.baseURL) in \(domain)") }
//        let version = dict[NetworkConstants.version] as? String ?? ""
//        guard
//            let endpointsDict = dict[NetworkConstants.endpointKey] as? [String: String],
//            let endpointURL = endpointsDict[endpoint]
//            else { fatalError("Could not find \(endpoint) endpoint in \(domain)") }
//        var url: String
//        if version.isEmpty {
//            url = fullURL ? baseURL + endpointURL : endpointURL
//        } else {
//            url = fullURL ? "\(baseURL)/\(version)\(endpointURL)" : "/\(version)\(endpointURL)"
//        }
//        return url
//    }
//
//    func authenticationURL(for endpoint: Endpoint.Authentication, fullURL: Bool = true) -> String {
//        return endpointFor(domain: Domain.auth, endpoint: endpoint.rawValue, fullURL: fullURL)
//    }
}
