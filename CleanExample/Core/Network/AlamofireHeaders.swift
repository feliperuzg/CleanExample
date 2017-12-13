//
//  File.swift
//  CleanExample
//
//  Created by Felipe Ruz on 13-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Alamofire

class AlamofireHeaders {

    private enum Constants {
        static let contentTypeKey = "Content-Type"
        static let acceptKey = "Accept"
        static let authorizationKey = "Authorization"
    }

    /// Convenience helper to generate Alamofire Request Headers
    /// - Parameter secure: (Optional: Default true) Indicates if the Response should include Auth Token
    /// - Returns: Request Headers
    class func headers(_ secure: Bool = true) -> HTTPHeaders {
        var headers: [String: String] = AlamofireHeaders.deafultHeaders()
        headers[Constants.acceptKey] = "application/hal+json"
        let storageLocator = StorageServiceLocator()
        if secure && !storageLocator.repository.authToken().isEmpty {
            headers[Constants.authorizationKey] = storageLocator.repository.authToken()
        }
        return headers
    }

    class func deafultHeaders() -> HTTPHeaders {
        var headers: [String: String] = SessionManager.defaultHTTPHeaders
        headers[Constants.contentTypeKey] = "application/json"
        return headers
    }
}
