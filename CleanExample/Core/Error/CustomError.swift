//
//  CustomError.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

struct CustomError: Error {

    var localizedTitle: String
    var localizedDescription: String
    var code: Int

    init(localizedTitle: String = "Error", localizedDescription: String, code: Int) {
        self.localizedTitle = localizedTitle
        self.localizedDescription = localizedDescription
        self.code = code
    }
}
