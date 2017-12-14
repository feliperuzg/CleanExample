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
    var networkConfigurationList = NetworkConstants.networkConfigurationList

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
                forResource: networkConfigurationList,
                ofType: NetworkConstants.fileExtension
            ),
            let plistData = FileManager.default.contents(atPath: plistPath),
            let dict = try? PropertyListSerialization.propertyList(
                from: plistData,
                options: .mutableContainersAndLeaves,
                format: &format
            ) as? [String: AnyObject] {
            configurationDictionary = dict
        } else {
            configurationDictionary = nil
        }
    }

    private func endpointFor(domain: Domain, endpoint: String) -> String? {
        guard
            let configurationDict = configurationDictionary,
            let dict = configurationDict[domain.rawValue] as? [String: AnyObject],
            let baseURL = dict[NetworkConstants.baseURL] as? String,
            let endpointsDict = dict[NetworkConstants.endpointKey] as? [String: String],
            let endpointURL = endpointsDict[endpoint]
        else { return nil }
        return "\(baseURL)/\(endpointURL)"
    }

    func authenticationURL(for endpoint: Endpoint.Authentication) -> String? {
        return endpointFor(domain: Domain.auth, endpoint: endpoint.rawValue)
    }
}
