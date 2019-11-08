//
//  CreateAccountModels.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum CreateAccount {
	struct SignUpForm {
		let name: String
		let email: String
		let password: String
		let confirmPassword: String
	}
	// MARK: Use cases
	enum SignUp {
		struct Request {
			let signUpForm: SignUpForm
		}
		struct Response {
			let response: SessionResponse?
		}
		struct ViewModel {
			struct SignUpViewModel {
				let success: Bool
			}
		}
	}
}
