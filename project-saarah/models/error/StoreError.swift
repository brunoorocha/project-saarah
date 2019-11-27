//
//  StoreError.swift
//  project-saarah
//
//  Created by Bruno Rocha on 18/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

struct FormFieldError {
    let error: String
    let field: String
}

enum StoreError: Error {
    case plain(message: String)
    case form(fields: [FormFieldError])
}
