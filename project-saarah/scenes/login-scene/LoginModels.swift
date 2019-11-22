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
            struct Success {}
            
            struct Failure {
                let formErrors: [FormFieldError]
            }
        }
        struct ViewModel {
            struct LoginViewModel {
                let success: Bool
            }

            struct FormErrorViewModel {
                let field: String
                let message: String
            }
        }
        struct Form {
            let email: String
            let passowrd: String
        }
    }
}
