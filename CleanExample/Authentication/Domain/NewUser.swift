//
//  NewUser.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

struct NewUser: User {
    var firstName: String
    var lastName: String
    var age: Int
    var phone: String
    var email: String
    var address: String

    init(fromEntity  entity: UserEntity) {
        firstName = entity.firstName
        lastName = entity.lastName
        age = entity.age
        phone = entity.phone
        email = entity.email
        address = entity.address
    }
}
