//
//  CustomError.swift
//  CleanExample
//
//  Created by Felipe Ruz on 19-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

struct CustomError: Error {

    private enum Defaults {
        static let title = "Error"
        static let description = "No podemos atender su solicitud en estos momentos"
        static let code = 500
    }

    var localizedTitle: String
    var localizedDescription: String
    var code: Int

    init(localizedTitle: String? = nil, localizedDescription: String? = nil, code: Int? = nil) {
        self.localizedTitle = localizedTitle ?? Defaults.title
        self.localizedDescription = localizedDescription ?? Defaults.description
        self.code = code ?? Defaults.code
    }
}
