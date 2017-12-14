//
//  File.swift
//  CleanExample
//
//  Created by Felipe Ruz on 13-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Alamofire

class AlamofireSession {
    var manager: Alamofire.SessionManager?
    static let sharedInstance: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders

        let manager = Alamofire.SessionManager(
            configuration: configuration,
            delegate: SessionDelegate()
        )
        return manager
    }()

    open class func execute(
        _ url: String,
        _ method: HTTPMethod? = .get,
        _ params: Parameters? = nil,
        _ secure: Bool? = true,
        headers: HTTPHeaders? = nil,
        onCompletion: @escaping (DefaultDataResponse) -> Void
    ) {
        AlamofireSession.sharedInstance.request(
            url,
            method: method!,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: headers ?? AlamofireHeaders.headers(secure!)
        ).response(completionHandler: { response in
            onCompletion(response)
        })
    }
}
