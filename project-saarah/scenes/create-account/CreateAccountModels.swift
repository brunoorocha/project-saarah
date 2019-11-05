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
	struct SignUpResponse: Decodable {
		let id: String
		let name: String
		let email: String
		let token: String
	}
	// MARK: Use cases
	enum SignUp {
		struct Request {
			let signUpForm: SignUpForm
		}
		struct Response {
			let response: SignUpResponse?
		}
		struct ViewModel {
			struct SignUpViewModel {
				let success: Bool
			}
		}
	}
}
