//
//  LoginModels.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum Login {
	// MARK: Use cases
    enum LogIn {
        struct Request {
            let form: Form
        }
        struct Response {
            let response: SessionResponse?
            let formErrors: [FormFieldError]?

            init(response: SessionResponse? = nil, formErrors: [FormFieldError]? = nil) {
                self.response = response
                self.formErrors = formErrors
            }
        }
        struct ViewModel {
            struct LoginViewModel {
                let success: Bool
            }

            struct FormError {
                let field: String
                let message: String
            }

            struct FormField {
                var label: String
                var placeholder: String
                var keyboardType: KeyboardType
                var identifier: String
                var errorLabel: String

                enum KeyboardType {
                    case normal
                    case email
                    case password
                    case number
                }
            }
        }
        struct Form {
            let email: String
            let passowrd: String
        }
    }
}
