//
//  Endpoint.swift
//  CleanExample
//
//  Created by Felipe Ruz on 12-12-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

enum Endpoint {
    enum Contacts: String {
        case contacts
        case contact
    }

    enum Home: String {
        case info
    }

    enum Authentication: String {
        case login = "authorize"
    }
}
