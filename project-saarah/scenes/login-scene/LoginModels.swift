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
    enum SignIn {
        struct Request {
            let form: Form
        }
        struct Response {
        }
        struct ViewModel {
            struct SignInViewModel {
                let success: Bool
            }
        }
        struct Form {
            let email: String
            let passowrd: String
        }
    }
}
