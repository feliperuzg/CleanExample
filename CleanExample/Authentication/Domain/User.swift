//
//  User.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

protocol User {
    var firstName: String { get }
    var lastName: String { get }
    var age: Int { get }
    var phone: String { get }
    var email: String { get }
    var address: String { get }
}
