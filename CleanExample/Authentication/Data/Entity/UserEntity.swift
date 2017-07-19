//
//  UserEntity.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

struct UserEntity {
    var firstName: String!
    var lastName: String!
    var age: Int!
    var phone: String!
    var email: String!
    var address: String!

    init(fromDictionary dictionary: [String: Any]) {
        // swiftlint:disable force_cast
        firstName = dictionary["firstName"] as! String
        lastName = dictionary["lastName"] as! String
        age = dictionary["age"] as! Int
        phone = dictionary["phone"] as! String
        email = dictionary["email"] as! String
        address = dictionary["address"] as! String
        // swiftlint:enable force_cast
    }
}
