//
//  ContactsDataSourceProtocol.swift
//  CleanExample
//
//  Created by Felipe Ruz on 24-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import Foundation

protocol ContactsDataSourceProtocol {
    // swiftlint:disable type_name
    associatedtype T
    // swiftlint:enable type_name
    func getContacts(
        onSuccess: @escaping ([T]) -> Void,
        onError: @escaping (CustomError) -> Void
    )
}
