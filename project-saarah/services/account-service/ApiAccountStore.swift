//
//  ApiAccountStore.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 05/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class ApiAccountStore: AccountStore {

    func login(email: String, password: String, _ completion: @escaping (Result<SessionResponse?, NetworkServiceError>) -> Void) {
        let networkService = NetworkService()
        networkService.request(endpoint: ConeheadApiEndpoint.login(email: email, passowrd: password)) { (result: Result<SessionResponse?, NetworkServiceError>) in
            completion(result)
        }
    }

	func signUp(name: String, email: String, password: String, confirmPassword: String, _ completion: @escaping (Result<SessionResponse?, NetworkServiceError>) -> Void) {
		let networkService = NetworkService()
		networkService.request(endpoint: ConeheadApiEndpoint.signUp(
            name: name, email: email, password: password,
            confirmPassword: confirmPassword)) { (result: Result<SessionResponse?, NetworkServiceError>) in
			completion(result)
		}
	}
}