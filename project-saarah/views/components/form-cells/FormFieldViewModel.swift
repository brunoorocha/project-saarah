//
//  FormFieldViewModel.swift
//  project-saarah
//
//  Created by Bruno Rocha on 19/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class FormFieldViewModel: NSObject {
    var label: String
    var placeholder: String
    var keyboardType: KeyboardType
    var identifier: String
    var errorLabel: String

    init (label: String, placeholder: String, keyboardType: KeyboardType = .normal, identifier: String, errorLabel: String = "") {
        self.label = label
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.identifier = identifier
        self.errorLabel = errorLabel
    }

    enum KeyboardType {
        case normal
        case email
        case password
        case number
    }
}
