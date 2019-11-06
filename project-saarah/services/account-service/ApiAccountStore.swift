//
//  ApiAccountStore.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 05/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class ApiAccountStore: AccountStore {
	func signUp(name: String, email: String, password: String, confirmPassword: String, _ completion: @escaping (Result<SignUpResponse?, NetworkServiceError>) -> Void) {
		let networkService = NetworkService()
		networkService.request(endpoint: ConeheadApiEndpoint.signUp(name: name, email: email, password: password, confirmPassword: confirmPassword)) { (result: Result<SignUpResponse?, NetworkServiceError>) in
			completion(result)
		}
	}
}
